import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/util/Galary.dart';
import 'package:flutter_app/widgets/util/Home.dart';
import 'package:flutter_app/widgets/util/Route.dart';

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLutter Navigation and Route",
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/', // Named routes
      // routes: {'/': (context) => Home(), '/galary': (context) => Galary()},
      // home: Home(),
      routes: routes,
    );
  }
}
