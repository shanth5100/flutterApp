import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apiUser.dart';

class Dashboard extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  String accessToken = '';
  String profiles = '';
  bool firstTime = true;
  String name = 'User Details..', type = '', email='', action='';

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      firstTime = !firstTime;
      Future.delayed(Duration(milliseconds: 500), populate4mSharedPrefs);
      // populateUserDetails();
    }
    return Scaffold(
        appBar: AppBar(title: Text('Dashboard'),),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
              children: [
                new Text('access-token: $accessToken'),
                new Text(''),
                new Text('Profiles JSON: $profiles'),
                new Text(''),
                new RaisedButton(
                    child: new Text('Load User Details.'),
                    onPressed: loadUserDetails),
                new Text(name),
                new Text(''),
                new Text(email),
                new Text(''),
                new Text(type),
                new Text(''),
                new Text(action),
                new Text(''),
              ]
          ),
        ),
    );
  }

  void populate4mSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token');
    print('access_token is: $accessToken');
    setState(() {
      accessToken = prefs.getString('access_token');
      profiles = prefs.getString('profiles');
    });
  }

  void loadUserDetails() async {
    Response response = await getLoggedInUser();
    // String lName, lEmail, l
    if (response == null || response.statusCode != 200) {
      setState(() {
        name = "Unable to load user Details..";
        email = "Response code: ${response.statusCode}";
        // action = "Response: ${response.body}";
      });
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      setState(() {
        name = 'User name: ${json['name']}';
        email = 'email: ${json['email']}';
        action = 'Action required: ${json['action']}';
        type = 'Role type: ${json['type']}';
      });
    }
  }
}