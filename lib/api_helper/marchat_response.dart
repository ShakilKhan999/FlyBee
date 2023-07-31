import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';
import 'package:flybee/models/rider_pickup_status_model.dart';
import 'package:flybee/models/status_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preference.dart';

class MarchantResponse {
  Future<MarchantModel?> getMarchantList() async {
    // EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString(USER_ID)!;
    print("riderid235:$id");
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        // 'POST', Uri.parse('http://starxpress.online/api/rider_all_merchant'));
        'POST', Uri.parse('http://apps.starxpress.online/api/rider_all_merchant'));
    request.bodyFields = {'rider_branch_id': id};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // EasyLoading.dismiss();
      return marchantModelFromJson(await response.stream.bytesToString());
    } else {
      // EasyLoading.dismiss();
      return null;
    }
  }

  Future<MerchantPickUpModel?> getMerchantPickupList(
      {required int userId}) async {
        EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString(USER_ID)!;
    String branch_id = await prefs.getString(BRANCH_ID)!;
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        // Uri.parse('http://starxpress.online/api/merchant_rider_pickup_list'));
        Uri.parse('http://apps.starxpress.online/api/merchant_rider_pickup_list'));
    request.bodyFields = {
      'rider_user_id': id,
      'rider_branch_id': branch_id,
      'merchant_user_id': userId.toString()
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
       EasyLoading.dismiss();
      return merchantPickUpModelFromJson(await response.stream.bytesToString());
    } else {
      EasyLoading.dismiss();
      return null;
    }
  }


  Future<MerchantPickUpModel?> getMerchantPickupReturnList(
      {required String phone}) async {
    EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString(USER_ID)!;
    String branch_id = await prefs.getString(BRANCH_ID)!;
    log('phone : '+phone);
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        // Uri.parse('http://starxpress.online/api/merchant_rider_pickup_list'));
        Uri.parse('http://apps.starxpress.online/api/rider_pickup_return_assign_list'));
    request.bodyFields = {
      'rider_user_id': id,
      'rider_branch_id': branch_id,
      'merchant_user_phone': phone
    };
    request.headers.addAll(headers);
  
    http.StreamedResponse response = await request.send();
  
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return merchantPickUpModelFromJson(await response.stream.bytesToString());
    } else {
      EasyLoading.dismiss();
      return null;
    }
  }


  Future<StatusList?> getMerchantPickupStatusList() async {
    String? token = await SharedPref().getString(ACCESS_TOKEN);
    String? id = await SharedPref().getString(USER_ID);
    var headers = {
      'accesstoken':
          'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        // Uri.parse('http://starxpress.online/api/rider_pickup_status_list'));
        Uri.parse('http://apps.starxpress.online/api/rider_pickup_status_list'));
    request.bodyFields = {'rider_user_id': '$id'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
       return statusListFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }
}
