import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AccountResponse{


  Future<Map<String, dynamic>> getCommissions(String accesstoken, String userId, String branchId) async {
    print("comhit234");
    var headers = {
      'accesstoken': 'Bearer $accesstoken',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer 2ujdICbAW8NxF1RuZsvOJtyjXcO9ceU-GegiS00akref6FB_Fh6Pz5zBcjH6p8dp'
    };

    var request = http.Request('POST', Uri.parse('http://apps.starxpress.online/api/rider_commission_balance'));
    request.bodyFields = {
      'rider_user_id': userId,
      'rider_branch_id': branchId,
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

  Future<void> updateRiderProfile(String accesstoken,
      String userId, String branchId,String username,String fname, String lname,
      String address, String email,String phn) async {
    EasyLoading.show();
    var headers = {
      'accesstoken': 'Bearer $accesstoken',
       'Content-Type': 'application/x-www-form-urlencoded'
    };

    var request = http.Request('POST', Uri.parse('http://apps.starxpress.online/api/update_profile'));
    request.bodyFields = {
      'userID': userId,
      'username': username??'',
      'firstName': fname??'',
      'lastName': lname??'',
      'address': address??'',
      'userEmail': email??'',
      'userPhone': phn??'',
      'modifier': '1',
      'modified': DateTime.now().toString().substring(0,11)
    };
    request.headers.addAll(headers);
    EasyLoading.dismiss();
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      String responseBody = await response.stream.bytesToString();
      print(responseBody);
    } else {
      EasyLoading.dismiss();
      print(response.reasonPhrase);
    }
  }


  Future<double> fetchCollectionAmount(String accesstoken, String userId, String branchId, String date) async {
    var headers = {
      'accesstoken': 'Bearer $accesstoken',
       'Content-Type': 'application/x-www-form-urlencoded'
    };

    var request = http.Request('POST', Uri.parse('http://apps.starxpress.online/api/rider_collection_balance'));
    request.bodyFields = {
      'rider_user_id': userId,
      'rider_branch_id': branchId,
      'date': date
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonMap = json.decode(responseBody);
      double collection = jsonMap['collection_amounts'] ??0;

      // Calculate the sum of collection amounts
      double sumCollectionAmount = 0;
      // for (var collection in collectionList) {
      //   sumCollectionAmount += collection['amount'] as double;
      // }

      return collection;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }


  Future<void> changePassword(String token, String id, String oldpass, String newpass) async {
    EasyLoading.show();
    var headers = {
      'accesstoken': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    var request = http.Request('POST', Uri.parse('http://apps.starxpress.online/api/changed_password'));
    request.bodyFields = {
      'userID': id,
      'old_password': oldpass,
      'password': newpass,
      'password_confirm': newpass
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      String responseBody = await response.stream.bytesToString();
      String mssg=responseBody.contains('Passwords do not match')?'Passwords do not match':'Can not change password';
       mssg=responseBody.contains('successfully updated')?'Passwords successfully updated':'Can not change password';

      print(responseBody);
      Fluttertoast.showToast(
        msg: mssg,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
        msg: "Password can not Change\nPlease try again\n${response.reasonPhrase}",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print(response.reasonPhrase);
    }
  }



}