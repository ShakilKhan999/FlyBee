
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/api_helper/delivery_response.dart';
import 'package:flybee/models/delivery_model.dart';

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
     print("deliverylist"+deliveryList.length.toString());
    await getDeliveryStatusList();
    // EasyLoading.dismiss();

    notifyListeners();

  }

   productInfoMapMaker(String info){
    var properties = json.decode(info);
    return properties;
  }
  getDeliveryStatusList() async {
    statusDeliveryList = [];
    deliveryStatus = await DeliveryResponse().getDeliveryStatusList();
    statusDeliveryList!.addAll(deliveryStatus!.statusDeliveryList!);
    notifyListeners();

  }

}