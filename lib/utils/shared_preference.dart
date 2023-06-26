import 'package:shared_preferences/shared_preferences.dart';

String ACCESS_TOKEN = "accessToken";
String USER_ID = "userID";
String USER_NAME = "userName";
String USER_IMAGE="image";
String USER_ADDRESS = "user_address";
String USER_EMAIL = "userEmail";
String USER_PHONE = "mobile";
String BRANCH_ID = "branch_id";
String BRANCH_NAME = "branch";
String DIVISION = "division";
String DISTRICT="district";
String UPAZILA="upazila";
String BANK="bank";
String NID="nid";

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
    return prefs.getString(key) as String;
  }
}
