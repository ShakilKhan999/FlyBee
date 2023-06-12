import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  Future<bool> login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('http://starxpress.online/api/user/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var dd = await json.decode(response.body);
        print("token234: ${dd["accessToken"]}");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken',dd["accessToken"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }
}
