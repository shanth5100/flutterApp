import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/sidemenu/Nav_Draw.dart';

class Sidemenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: Nav_Draw(),
      appBar: AppBar(
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text("Side menu and its main icons"),
      ),
    ));
  }
}
