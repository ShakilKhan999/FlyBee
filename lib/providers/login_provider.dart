import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flybee/api_helper/api_login.dart';
import 'package:flybee/models/user_model.dart';

class LoginProvider extends ChangeNotifier {
  UserModel? userInfo;

  Future<bool> login(String mail, String pass) async {
    bool success = false;
    userInfo = await ApiLogin().login(mail.trim(), pass.trim());
    notifyListeners();
    userInfo!.accessToken!=null?success=true:success=false;
    log(userInfo!.getUser![0]!.userName!);
    return success;
  }
}
