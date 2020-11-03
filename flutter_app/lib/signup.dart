import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';

import 'constants.dart' as Constants;
import './service/register.dart' as Register;

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);
  // final String title;
  SignUpScreen createState() => SignUpScreen();
}

// "/user/register"
class SignUpScreen extends State<Signup> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // title: Text('New User Registration'),
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          children: [
            new TextFormField(
              decoration: new InputDecoration(labelText: 'Your name'),
              controller: usernameController,
            ),
            new TextFormField(
              decoration: new InputDecoration(labelText: 'Your email'),
              controller: emailController,
              // onEditingComplete: checkEmailExists,
              // onFieldSubmitted: checkEmailExists,
            ),
            new TextFormField(
              decoration: new InputDecoration(labelText: 'Your password'),
              controller: pwdController,
            ),
            // new Text('Page under construction'),
            new Text('\n. Use below website for the time being..!'),
            Text(''),
            new RaisedButton(
              onPressed: _submit,
              // onPressed: () {
              //   openBrowser(context);
              // },
              child: Text('Open Web SignUp Page'),
            )
          ],
        ),
      ),
    );
  }

  void checkEmailExists() {
    String email = emailController.text;
    print("   = " + email);
    Future<Response> future = Register.emailExists(email);
  }

  void _submit() {
    String username = usernameController.text;
    String password = pwdController.text;
    String email = emailController.text;

    Map<String, dynamic> jsonData = {
      "name": username,
      "email": email,
      "password": password
    };
    Future<Response> future = Register.register(jsonData);
    print(future);
    // Response response =
    // future.then((value) => showDashboard(value));
  }

  Future openBrowser(BuildContext context) async {
    if (await canLaunch(Constants.SINGUP_LINK)) {
      await launch(Constants.SINGUP_LINK);
      return;
    } else {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the that user has entered by using the
            // TextEditingController.
            content: Text('Unable to open URL: ${Constants.SINGUP_LINK}'),
          );
        },
      );
    }
  }
}
