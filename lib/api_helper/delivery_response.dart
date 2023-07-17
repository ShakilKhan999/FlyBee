
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/models/delivery_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/delivery_status_model.dart';

class DeliveryResponse {
  Future<DeliveryModel?> getDeliveryList() async {
     EasyLoading.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id= await prefs.getString(USER_ID)!;
    print("${await SharedPref().getString(ACCESS_TOKEN)}");
    print("riderid234:$id");
    var headers = {
      'accesstoken':
          'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        // 'POST', Uri.parse('http://starxpress.online/api/rider_delivery_list'));
        'POST', Uri.parse('http://starxpress.online/api/rider_delivery_list'));
    request.bodyFields = {'rider_user_id': id};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      return deliveryModelFromJson(await response.stream.bytesToString());
    } else {
       EasyLoading.dismiss();
      return null;
    }
  }




    Future<DeliveryStatus?> getDeliveryStatusList() async {
    var headers = {
      'accesstoken':
          'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        // Uri.parse('http://starxpress.online/api/rider_delivery_status_list'));
        Uri.parse('http://starxpress.online/api/rider_delivery_status_list'));
    request.bodyFields = {'rider_user_id': '${await SharedPref().getString(USER_ID)}'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // log('status data : '+await response.stream.bytesToString());
       return deliveryStatusFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }
  
}
