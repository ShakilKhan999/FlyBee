import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flybee/api_helper/api_login.dart';
import 'package:flybee/models/basic_userInfo_model.dart';
import 'package:flybee/models/user_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  UserModel? userInfo;
  late BasicUserInfoModel basicUserInfoModel;
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

  Future<void> getinfo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    basicUserInfoModel.name =await prefs.getString(USER_NAME);
    basicUserInfoModel.id=await prefs.getString(USER_ID);
    basicUserInfoModel.mobile=await prefs.getString(USER_PHONE);
    basicUserInfoModel.mail=await prefs.getString(USER_EMAIL);
    basicUserInfoModel.branch=await prefs.getString(BRANCH_ID);
    basicUserInfoModel.Nid=await prefs.getString(NID);
    basicUserInfoModel.bank=await prefs.getString(BANK);
    basicUserInfoModel.area=await prefs.getString(USER_ADDRESS);
    notifyListeners();
  }
}
