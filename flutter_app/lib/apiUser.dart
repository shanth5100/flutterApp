import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'constants.dart' as Constants;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> getLoggedInUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String bearerStr  = 'Bearer ${prefs.get('access_token')}';
  final http.Response response = await http.get(Constants.URL_USER,
    headers: <String, String>{
      'Authorization': '$bearerStr',
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return response;
}

