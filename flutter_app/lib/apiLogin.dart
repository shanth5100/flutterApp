import 'dart:convert';

import 'package:http/http.dart' as http;
import 'constants.dart' as Constants;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> login(username, password) async {
  String encode = String.fromCharCodes(utf8.encode('grant_type'));
  print('Constants.URL_LOGIN: ${Constants.URL_LOGIN}');
  final http.Response response = await http.post(
    Constants.URL_LOGIN,
    // ,
    headers: <String, String>{
      HttpHeaders.authorizationHeader: Constants.basicAuth,
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
      // 'Content-Type': 'application/json; charset=UTF-8',
    },
    body: {
      // body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
      'grant_type': 'password',
    },
  );

  await processResponse(response);
  return response;
}

Future processResponse(http.Response response) async {
  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
    prefs.remove('refresh_token');
    prefs.remove('profiles');
    Map<String, dynamic> respJson = jsonDecode(response.body);
    Constants.appUserToken = respJson['access_token'];
    Constants.refreshToken = respJson['refresh_token'];
    prefs.setString('access_token', respJson['access_token']);
    prefs.setString('refresh_token', respJson['refresh_token']);
    prefs.setString('profiles', respJson['profiles'].toString());
  } else {
    print('invalid response: ${response.statusCode}');
  }
}
