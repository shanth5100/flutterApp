import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Login.dart';
import 'package:flutter_app/widgets/dummyAPI/Employee.dart';
import 'package:flutter_app/widgets/util/Galary.dart';
import 'package:flutter_app/widgets/util/Home.dart';

// const routes = {'/login': (BuildContext context) => new Login()};
final routes = {
  // '/login': (BuildContext context) => new Login(),
  '/home': (BuildContext context) => new Home(),
  '/galary': (BuildContext context) => new Galary(),
  // '/': (BuildContext context) => new Login(),
  '/': (BuildContext context) => new Employee(),
};
