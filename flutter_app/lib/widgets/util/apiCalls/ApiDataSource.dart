import 'package:flutter_app/widgets/data/GlobalKeys.dart';
import 'package:flutter_app/widgets/util/Config.dart';
import 'package:flutter_app/widgets/util/apiCalls/NetworkUtil.dart';

class ApiDataSource {
  NetworkUtil networkUtil = NetworkUtil();

  Future login(String username, String password) {
    // http://test-api.124apps.com/bills/auth (or)cloud
    // print(Config);

    // return networkUtil.login(Config["authBaseUrl"], params);
    return networkUtil.login(Config["authBaseUrl"], username, password);
  }
}
