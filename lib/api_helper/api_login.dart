import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flybee/models/user_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  Future<UserModel> login(String email, password) async {
    EasyLoading.show();
    late UserModel user;
    try {
      Response response = await post(
          // Uri.parse('http://starxpress.online/api/user/login'),
          Uri.parse('http://apps.starxpress.online/api/user/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        EasyLoading.dismiss();
        user = userModelFromJson(response.body);
        // var dd = await json.decode(response.body);
        // print("token234: ${dd["accessToken"]}");
        SharedPref().setString(ACCESS_TOKEN, user.accessToken.toString());
        SharedPref().setString(USER_ID, user.getUser![0].userId.toString());
        SharedPref().setString(NID, user.getUser![0].nidFront.toString());
        SharedPref().setString(BANK, user.getUser![0].bankName.toString());
        SharedPref().setString(USER_ADDRESS, user.getUser![0].address.toString());
        SharedPref().setString(BRANCH_ID, user.getUser![0].branchId.toString());
        SharedPref().setString(BRANCH_NAME, user.branch![0].branch.toString());
        SharedPref()
            .setString(USER_EMAIL, user.getUser![0].userEmail.toString());
        SharedPref().setString(USER_NAME, user.getUser![0].userName.toString());
        SharedPref().setString(FIRST_NAME, user.getUser![0].firstName.toString());
        SharedPref().setString(LAST_NAME, user.getUser![0].lastName.toString());
        SharedPref()
            .setString(USER_PHONE, user.getUser![0].userPhone.toString());
        SharedPref().setString(USER_IMAGE, user.getUser![0].image.toString());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString(USER_NAME);
        print("name234${token}");
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('accessToken',dd["accessToken"]);
        return user;
      } else {
        Fluttertoast.showToast(
          msg: "Wrong username or password",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
    }
    return user;
  }
}
