import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../constants.dart' as Constants;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../apiLogin.dart';

Future<http.Response> register(data) async {
  var data1 = "";
  if (data1 == null) {
    print("If true data = '' = null");
  } else {
    print("False :");
  }
  await getToken();
  print(Constants.appUserToken);
  // Constants.appUserToken =
  //     null ? await http.post(Constants.URL_USER + "/register") : "";

  Future<Response> futureResp = http.post(Constants.URL_USER + "/register",
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "Bearer " + Constants.appUserToken,
        // HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        // 'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data);
  print("Register : ");
  print(futureResp.toString());
  futureResp.then((value) => {print(value.body)});
}

Future<http.Response> getToken() async {
  Future<Response> future = login(Constants.DUMMY_USER, Constants.DUMMY_PWD);
  // print("Get Token ");
  var data;
  future.then((value) => {data = value.body});
  // future.then((value) => {print(value.body)});
  // Constants.dummyUserToken = data ? data.access_token : null;
  // print("Data : " + data);
  print(Constants.appUserToken);
  // print(Constants.dummyUserToken);
  return future;
  // Future<Response> future = http.get(Constants.URL_USER + "exists?email="+);
}

Future<http.Response> emailExists(email) async {
  Future<Response> future = getToken();
  future.then((value) => {print(value.body)});
  // http.get(Constants.URL_USER + "exists?email=");
}

Future processResponse(http.Response response) async {
  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
    prefs.remove('refresh_token');
    prefs.remove('profiles');
    Map<String, dynamic> respJson = jsonDecode(response.body);
    prefs.setString('access_token', respJson['access_token']);
    prefs.setString('refresh_token', respJson['refresh_token']);
    prefs.setString('profiles', respJson['profiles'].toString());
  } else {
    print('invalid response: ${response.statusCode}');
  }
}
