// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/util/Home.dart';
// import 'dart:html';

class Galary extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galary Navigation"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto Home"),
          color: Colors.black12,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
    );
  }
}
