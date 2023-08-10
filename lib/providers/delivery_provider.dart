import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/api_helper/delivery_response.dart';
import 'package:flybee/models/delivery_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/delivery_status_model.dart';

class DeliveryProvider extends ChangeNotifier {
  DeliveryModel? deliveryModel;
  List<AssignDeliveryList> deliveryList = [];
  DeliveryStatus? deliveryStatus;
  List<StatusDeliveryList>? statusDeliveryList;


// delivery assign
  getDeliveryList() async {
    deliveryList = [];
    // EasyLoading.show();
    deliveryModel = await DeliveryResponse().getDeliveryList();
    deliveryList.addAll(deliveryModel!.assignDeliveryList!);
    print("deliverylist" + deliveryList.length.toString());
    await getDeliveryStatusList();
    // EasyLoading.dismiss();

    notifyListeners();
  }

  productInfoMapMaker(String info) {
    var properties = json.decode(info);
    return properties;
  }


// delivery status
  getDeliveryStatusList() async {
    statusDeliveryList = [];
    deliveryStatus =
        (await DeliveryResponse().getDeliveryStatusList()) as DeliveryStatus?;
    statusDeliveryList!.addAll(deliveryStatus!.statusDeliveryList!);
    notifyListeners();
  }

  saveDelivery(
      {required String pickupId,
      required String statusId,
      required BuildContext context,
      String remark = 'remarks'
      }) async {
     log('Remarks : '+remark);
     EasyLoading.show();
     SharedPreferences prefs = await SharedPreferences.getInstance();
    //  String? userId = await SharedPref().getString(USER_ID);
    //  String? branchId = await SharedPref().getString(BRANCH_ID);
         String userId = await prefs.getString(USER_ID)!;
         String branchId = await prefs.getString(BRANCH_ID)!;
         String accessToken = await prefs.getString(ACCESS_TOKEN)!;
    var headers = {
      'accesstoken': 'Bearer $accessToken',
    };
    var request = http.Request(
        'POST', Uri.parse('http://starxpress.online/api/rider_picked_up'));
    request.bodyFields = {
      'rider_user_id': userId,
      'created_branch_id': branchId!,
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'pickup_data': '[{"pickup_id":"$pickupId","i_delivery_status_id_18":$statusId,"remarks":"$remark"}]'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getDeliveryList();
      await getDeliveryStatusList();
      // AddDeliveryResponse addDeliveryResponse =
      //     addDeliveryResponseFromJson(await response.stream.bytesToString());
      // if (addDeliveryResponse.success!) {
        EasyLoading.dismiss();
      final snackBar = SnackBar(
        content: const Text('Successfull'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
    } else {
      print(response.reasonPhrase);
    }
  }
}
