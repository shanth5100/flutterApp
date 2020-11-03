library constants;

import 'dart:convert';

// https://ppe-cloud.124apps.com/bills/auth/oauth/token
const String CLOUD_BASE = 'https://ppe-cloud.124apps.com/bills',
    URL_LOGIN = CLOUD_BASE + '/auth/oauth/token',
    URL_USER = CLOUD_BASE + '/cloud/user',
    SINGUP_LINK = 'https://ppeui-bills.124apps.com/signup',
    DUMMY_USER = "dummy@email.com",
    DUMMY_PWD = "dummyPwd";
String clientUser = "trusted-app", clientSecret = "secret";
String basicAuth =
    'Basic ' + base64Encode(utf8.encode('$clientUser:$clientSecret'));

String dummyUserToken = null, appUserToken = "", refreshToken = "";

String hello() {
  return 'Hello World.';
}
