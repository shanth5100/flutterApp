// import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Goto galary"),
          color: Colors.black12,
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Galary()));
            Navigator.pushNamed(context, '/galary');
          },
        ),
      ),
    );
  }
}
