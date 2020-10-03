import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/widgets/util/Config.dart';
import 'package:flutter_app/widgets/util/apiCalls/ApiDataSource.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> login_form = GlobalKey<FormState>();
  bool autoValidate = false;
  int id;
  String name;
  double salary;
  int age;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Form Validation"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Form(
              key: login_form,
              autovalidate: autoValidate,
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          onSaved: (String nameVal) {
            name = nameVal;
          },
          decoration: const InputDecoration(
            labelText: 'Name',
            hintText: 'Enter your name',
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
        ),
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            // onSaved: (String emilValue) {
            //   email = emilValue;
            // },
            validator: emailValidate,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
            )),
        new SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          onPressed: handleSubmit,
          child: Text('Validate'),
        )
      ],
    );
  }

  String emailValidate(String emailVal) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(emailVal)) {
      return "Enter valid email in mailformats";
    } else {
      return null;
    }
  }

  void handleSubmit() {
    print(Config["authBaseUrl"]);
    if (login_form.currentState.validate()) {
      print("IF block,  No errors ");
      ApiDataSource apiDataSource = ApiDataSource();
      // apiDataSource.login(email, password);
      login_form.currentState.save();
    } else {
      print("ELSE block,  errors ");
      setState(() {
        autoValidate = true;
      });
    }
  }
}
