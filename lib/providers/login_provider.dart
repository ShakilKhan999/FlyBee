import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/api_helper/api_login.dart';

class LoginProvider extends ChangeNotifier {
  Future<bool> login(String mail, String pass) async {
    bool success = false;
    EasyLoading.show();
    success = await ApiLogin().login(mail, pass);
    EasyLoading.dismiss();
    return success;
  }
}
