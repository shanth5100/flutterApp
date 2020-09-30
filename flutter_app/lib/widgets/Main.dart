import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/util/Home.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLutter Navigation and Route",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}
