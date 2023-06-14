import 'dart:developer';

import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';
import 'package:flybee/models/rider_pickup_status_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preference.dart';

class MarchantResponse {
  Future<MarchantModel?> getMarchantList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString(USER_ID)!;
    print("riderid235:$id");
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('http://starxpress.online/api/rider_all_merchant'));
    request.bodyFields = {'rider_branch_id': id};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return marchantModelFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }

  Future<MerchantPickUpModel?> getMerchantPickupList(
      {required String phone}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = await prefs.getString(USER_ID)!;
    String branch_id = await prefs.getString(BRANCH_ID)!;
    print("riderid234:$id");
    print("riderbranchid234:$branch_id");
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        Uri.parse('http://starxpress.online/api/merchant_rider_pickup_list'));
    request.bodyFields = {
      'rider_user_id': id,
      'rider_branch_id': branch_id,
      'marchant_user_phone': phone
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return merchantPickUpModelFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }

  Future<RiderPickUpStatusModel?> getMerchantPickupStatusList() async {
    var headers = {
      'accesstoken':
          'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        Uri.parse('http://starxpress.online/api/rider_pickup_status_list'));
    request.bodyFields = {'rider_user_id': '${await SharedPref().getString(USER_ID)}'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
       return riderPickUpStatusModelFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }
}
