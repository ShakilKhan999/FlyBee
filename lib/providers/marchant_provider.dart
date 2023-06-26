import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/api_helper/marchat_response.dart';
import 'package:flybee/models/Merchant_data_model.dart';
import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';
import 'package:flybee/models/rider_pickup_status_model.dart';

class MarchantProvider extends ChangeNotifier {
  MarchantModel? marchantModel;
  List<RiderMerchant> marchantList = [];

  MerchantPickUpModel? merchantPickUpModel;
  List<MerchantDataModel> merchantDataList = [];
  
  RiderPickUpStatusModel? riderPickUpStatusModel;
  List<StatusPickupList>? statusPickupList;


  getMarchantList() async {
    marchantList = [];
    merchantDataList = [];
    marchantModel = await MarchantResponse().getMarchantList();
    marchantList.addAll(marchantModel!.riderMerchants!);

    for (int i = 0; i < marchantList.length; i++) {
      merchantPickUpModel = await MarchantResponse().getMerchantPickupList(phone: marchantList[i].userPhone!);
      if (merchantPickUpModel != null) {
      
        merchantDataList.add(MerchantDataModel(
            marchantModel, merchantPickUpModel!.assignBranchPickupList!));
      }
    }

    await getRiderPickupStatusList();

    notifyListeners();
  }

  productInfoMapMaker(String info){
    var properties = json.decode(info);
    return properties;
  }

  getRiderPickupStatusList() async {
    statusPickupList = [];
    riderPickUpStatusModel = await MarchantResponse().getMerchantPickupStatusList();
    statusPickupList!.addAll(riderPickUpStatusModel!.statusPickupList!);
    notifyListeners();

  }
}
