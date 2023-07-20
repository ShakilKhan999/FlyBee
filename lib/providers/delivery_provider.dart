import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flybee/api_helper/delivery_response.dart';
import 'package:flybee/models/delivery_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/delivery_status_model.dart';

class DeliveryProvider extends ChangeNotifier {
  DeliveryModel? deliveryModel;
  List<AssignDeliveryList> deliveryList = [];
  DeliveryStatus? deliveryStatus;
  List<StatusDeliveryList>? statusDeliveryList;

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
      required BuildContext context}) async {
    log('${await SharedPref().getString(ACCESS_TOKEN)}');
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('http://starxpress.online/api/rider_picked_up'));
    request.bodyFields = {
      'rider_user_id': "${await SharedPref().getString(USER_ID)}",
      'created_branch_id': '${await SharedPref().getString(BRANCH_ID)}',
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'pickup_data':
          '[{"pickup_id": $pickupId,"i_delivery_status_id_18":$statusId,"remarks":"test2"}]'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // AddDeliveryResponse addDeliveryResponse =
      //     addDeliveryResponseFromJson(await response.stream.bytesToString());
      // if (addDeliveryResponse.success!) {
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
