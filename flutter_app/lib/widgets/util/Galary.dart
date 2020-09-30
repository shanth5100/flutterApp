// import 'dart:html';

import 'package:flutter/material.dart';
// import 'Home.dart';
// import 'dart:html';

class Galary extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Goto Home"),
          color: Colors.black12,
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Home()));
            // Navigator.pushNamed(context, '/galary'); // Named routes
            Navigator.pop(context);
          },
        ),
      ),
      appBar: AppBar(
        title: Text("Galary Navigation"),
      ),
    );
  }
}
