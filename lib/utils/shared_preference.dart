import 'package:shared_preferences/shared_preferences.dart';

String ACCESS_TOKEN = 'accessToken';
String USER_ID = 'user_id';
String USER_NAME = 'user_name';
String USER_ADDRESS = 'user_address';
String USER_EMAIL = 'user_email';
String USER_PHONE = 'user_phone';
String BRANCH_NO = 'branch_no';

class SharedPref {
  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
