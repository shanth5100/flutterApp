// http://dummy.restapiexample.com/api/v1/employees

import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/dummyAPI/EmployeeBean.dart';
import 'package:flutter_app/widgets/dummyAPI/EmployeeList.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<EmployeeBean>> fetchEmployee(http.Client client) async {
  final response =
      await client.get('http://dummy.restapiexample.com/api/v1/employees');
  // print(response.body);
  // return compute(parsePosts(response.body.toString()), response.body);
  // print(compute(parsePosts, response.body));
  // return compute(parsePosts, response.body);
  // return response;
  return parsePosts(response.body);
}

List<EmployeeBean> parsePosts(String responseBody) {
  final Map<String, dynamic> parsed = json.decode(responseBody);
  var data = HashMap.from(parsed);
  return
  // final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  // return parsed
  //     .map<EmployeeBean>((json) => EmployeeBean.fromJson(json))
  //     .toList();

  // final jsonData = json.decode(responseBody).castMap<String, dynamic>();
  //
  // print(jsonData["data"]);
  // jsonData["data"]

  // return jsonData.map
  // print(responseBody.runtimeType);
  //
  // print("responseBody   " + {"name": "pras"}.toString());
  // // print("responseBody   " + responseBody.toString());
  // // final Map<String, dynamic> parsed = json.decode(responseBody); //.cast<Map<String, dynamic>>();
  // final parsed = json.decode(responseBody); //.cast<Map<String, dynamic>>();
  // print(parsed.runtimeType);
  //
  // return parsed.map((key, value) => EmployeeBean.fromJson(value));
  // // return parsed
  // //     .map<EmployeeBean>((json) => EmployeeBean.fromJson(json))
  // //     .toList();
}

class Employee extends StatefulWidget {
  Employee({Key key}) : super(key: key);

  @override
  EmployeeState createState() => EmployeeState();
}

class EmployeeState extends State<Employee> {
  final GlobalKey<FormState> login_form = GlobalKey<FormState>();
  bool autoValidate = false;
  String name;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Employee"),
      ),
      body: FutureBuilder<List<EmployeeBean>>(
        future: fetchEmployee(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          } else {
            return snapshot.hasData
                ? EmployeeList()
                : Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
