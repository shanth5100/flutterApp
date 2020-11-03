import 'package:flutter/material.dart';

class BRLogin extends StatefulWidget {
  BRLogin({Key key}) : super(key: key);

  @override
  BRLoginState createState() => BRLoginState();
}

class BRLoginState extends State<BRLogin> {
  final GlobalKey<FormState> br_login_form = GlobalKey<FormState>();
  bool autoValidate = false;
  int id;
  String userName;
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
              key: br_login_form,
              autovalidate: autoValidate,
              child: BrLoginForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget BrLoginForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          onSaved: (String nameVal) {
            userName = nameVal;
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
}
