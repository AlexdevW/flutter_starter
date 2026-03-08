import 'dart:convert';

import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:flutter_start/util/navigator_util.dart';
import 'package:http/http.dart' as http;

import 'header_util.dart';

///登录接口
class LoginDao {
  static const boardingPass = "boarding_pass";

  static Future<void> login({
    required String userName,
    required String password,
  }) async {
    Map<String, String> paramsMap = {};
    paramsMap['userName'] = userName;
    paramsMap['password'] = password;
    // var uri = Uri.https('api.geekailab.com', '/uapi/user/login', paramsMap);
    // final response = await http.post(uri, headers: hiHeaders());
    dynamic response = {
      "statusCode": 200,
      "bodyBytes": utf8.encode(
        json.encode({
          // 此处增加 utf8.encode 将 string 转成 List<int>
          "code": 0,
          "data": "ZmEtMjAyMS0wNC0xMaiAyMToyddMjoyMC1mYQ==ft",
          "msg": "SUCCESS.",
        }),
      ),
    };
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response['bodyBytes']);
    print('test $bodyString');
    if (response['statusCode'] == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data'] != null) {
        //保存登录令牌
        _saveBoardingPass(result['data']);
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  static void _saveBoardingPass(String value) {
    HiCache.getInstance().setString(boardingPass, value);
  }

  static dynamic getBoardingPass() {
    return HiCache.getInstance().get(boardingPass);
  }

  ///登出
  static void logOut() {
    //移除登录保存的信息
    HiCache.getInstance().remove(boardingPass);
    NavigatorUtil.goToLogin();
  }
}
