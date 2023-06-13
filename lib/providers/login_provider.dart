import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flybee/api_helper/api_login.dart';
import 'package:flybee/models/basic_userInfo_model.dart';
import 'package:flybee/models/user_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  UserModel? userInfo;
  BasicUserInfoModel? basicUserInfoModel;
  String? name;

  Future<bool> login(String mail, String pass) async {
    bool success = false;
    userInfo = await ApiLogin().login(mail.trim(), pass.trim());
    notifyListeners();
    userInfo!.accessToken!=null?success=true:success=false;
    name!= await SharedPref().getString(USER_NAME);
    notifyListeners();
    log(userInfo!.getUser![0]!.userName!);
    return success;
  }

  // Future<void> getuserProfileinfo()async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   basicUserInfoModel!.name!= await prefs.getString(USER_NAME);
  //   print("name123"+basicUserInfoModel!.name);
  //   basicUserInfoModel!.id!=  await prefs.getString(USER_ID);
  //   print(basicUserInfoModel!.id);
  //   basicUserInfoModel!.image!= await SharedPref().getString(USER_IMAGE);
  //   basicUserInfoModel!.mail!= await SharedPref().getString(USER_EMAIL);
  //   basicUserInfoModel!.mobile!= await SharedPref().getString(USER_PHONE);
  //   basicUserInfoModel!.Nid!= await SharedPref().getString(NID);
  //   basicUserInfoModel!.branch!= await SharedPref().getString(BRANCH_NO);
  //   basicUserInfoModel!.bank!= await SharedPref().getString(BANK);
  //   notifyListeners();
  // }
}
