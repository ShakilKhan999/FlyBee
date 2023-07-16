import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class AccountResponse{


  Future<Map<String, dynamic>> getCommissions(String accesstoken, String userId, String branchId) async {
    print("comhit234");
    var headers = {
      'accesstoken': 'Bearer $accesstoken',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer 2ujdICbAW8NxF1RuZsvOJtyjXcO9ceU-GegiS00akref6FB_Fh6Pz5zBcjH6p8dp'
    };

    var request = http.Request('POST', Uri.parse('http://starxpress.online/api/rider_commission_balance'));
    request.bodyFields = {
      'rider_user_id': userId,
      'rider_branch_id': branchId
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var data;

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      data = json.decode(responseBody);
    } else {
      print(response.reasonPhrase);
    }

    return data;
  }

}