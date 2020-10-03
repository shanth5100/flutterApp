import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_app/widgets/data/GlobalKeys.dart';

import 'package:http/http.dart' as http;

class NetworkUtil {
  // static NetworkUtil instance1 = new NetworkUtil.internalConstructor();
  // NetworkUtil.internalConstructor();

  // below 3lines makes this class as Singleton
  static NetworkUtil instance = new NetworkUtil.internal();

  NetworkUtil.internal(); // constructor
  factory NetworkUtil() => instance;

  final JsonDecoder jsonDecoder = JsonDecoder();

  Future login(String url, String username, String password,
      {Map headers, body, encoding}) {
    var params = {
      "grant_type": grantType["PASSWORD"],
      "username": username,
      "password": password
    };
    // print("NetworkUtil Future login ");

    const reqHeaders = {"Content-Type": "application/json"};
    // var urlPath = Uri.https(url, "/oauth/token", params);
    print("urlPath: " + url);

    return http.post(url).then((http.Response response) {
      String resp = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return resp;
    });
  }
}

// Future<Response> login(
//   String url,
//   params,
// ) async {
// BaseOptions baseOptions = BaseOptions(
//   // baseUrl: url + "/oauth/token",
//   baseUrl: url,
// );
// Options options = Options(headers: {"Content-Type": "application/json"});
// Dio dio = Dio(baseOptions);
// Response response = dio.post(
//   '/oauth/token',
//   options: options,
//   data: {"params": params},
// ) as Response;
//
// print(response);
// return response;

// return http
//     .post(url, body: body, headers: headers, encoding: encoding)

// return http
//     .post(url + "/oauth/token",
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json"
//         }, //reqHeaders,
//         body: body,
//         encoding: encoding)
//     .then((http.Response response) {
//   String resp = response.body;
//   final int statusCode = response.statusCode;
//   if (statusCode < 200 || statusCode > 400 || json == null) {
//     throw new Exception("Error while fetching data");
//   }

//   return jsonDecoder.convert(resp);
// });

// return http.put(url, headers: reqHeaders)
// .then((value) => null);
