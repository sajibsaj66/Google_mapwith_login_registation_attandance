import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview/src/business_logics/utils/api_response_object.dart';
import 'package:interview/src/business_logics/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthAPIServices {
  http.Client _client = http.Client();
  var logger = Logger();

  // driver login
  Future<ResponseObject> userLogin(String email, String password) async {
    try {
      var _response = await _client.post(
        //'https://erp.ibos.io/identity/TokenGenerate/IbosLogin',
        'https://reqres.in/api/login',
        body: jsonEncode({'username': email, 'password': password}),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        var decodedResponse = jsonDecode(_response.body);
        logger.d(decodedResponse);
        if (decodedResponse['success'] == true) {
          UserData.token = decodedResponse['token'];
          UserData.email = email;
          UserData.refreshToken = decodedResponse['refreshToken'];
          logger.w(UserData.token);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', UserData.token);
          return ResponseObject(
            id: ResponseCode.SUCCESSFUL,
            object: 'login successful',
          );
        } else {
          return ResponseObject(
              id: ResponseCode.FAILED, object: decodedResponse['message']);
        }
      } else {
        return ResponseObject(
            id: ResponseCode.FAILED,
            // object: 'Status code for request ${_response.statusCode}');
            object: 'Login Falied \n Invalid Email or Password ');
      }
    } catch (e) {
      logger.e(e);
      return ResponseObject(id: ResponseCode.FAILED, object: e.toString());
    }
  }
}
