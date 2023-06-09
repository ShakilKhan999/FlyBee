import 'package:http/http.dart';

class ApiLogin {
  Future<bool> login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('http://starxpress.online/api/user/login'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
