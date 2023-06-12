import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/models/user_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  Future<UserModel> login(String email, password) async {
    EasyLoading.show();
    late UserModel user;
    try {
      Response response = await post(
          Uri.parse('http://starxpress.online/api/user/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        EasyLoading.dismiss();
        user=userModelFromJson(response.body);
        var dd = await json.decode(response.body);
        print("token234: ${dd["accessToken"]}");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken',dd["accessToken"]);
        return user;
      } else {
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
    }
    return user;
  }
}
