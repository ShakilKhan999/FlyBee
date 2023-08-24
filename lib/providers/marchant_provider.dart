import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/api_helper/marchat_response.dart';
import 'package:flybee/models/Merchant_data_model.dart';
import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';
import 'package:flybee/models/status_list.dart';
import 'package:intl/intl.dart';

import '../utils/shared_preference.dart';
import 'package:http/http.dart' as http;

class MarchantProvider extends ChangeNotifier {
  MarchantModel? marchantModel;
  List<RiderMerchant> marchantList = [];

  MerchantPickUpModel? merchantPickUpModel;
  List<MerchantDataModel> merchantDataList = [];

  MerchantPickUpModel? riderPickUpStatusModel;

  StatusList? statusList;
  List<StatusPickupList>? statusPickupList;

  List<bool> pickupBools = [];
  List<List<bool>> merchantBools = [];
  List<AssignBranchPickupList>? assignBranchPickupList;

// get marchant list
  getMarchantList() async {
    marchantList = [];
    merchantDataList = [];
    EasyLoading.show();
    marchantModel = await MarchantResponse().getMarchantList();
    marchantList.addAll(marchantModel!.riderMerchants!);
    print("marlist123" + marchantList.length.toString());
    EasyLoading.dismiss();
    log('message hhhh');
    log(DateTime.now().add(Duration(days: 5)).toString());

    notifyListeners();
  }

  bool merhcanthavePickup(){
    bool havepickup=false;
    for(int i=0;i<marchantList.length;i++)
      {
        if(marchantList[i].pickupOrderCount!=0){
          havepickup=true;
        }
      }
    return havepickup;
  }

  getPickupfromMerchant(int index) async {
    print("pickcallid123" + index.toString());
    merchantPickUpModel = await MarchantResponse()
        .getMerchantPickupList(userId: marchantList[index].userId!);
    print(merchantPickUpModel!.assignBranchPickupList!.length);
    if (merchantPickUpModel != null) {
      merchantDataList.add(MerchantDataModel(
          marchantModel, merchantPickUpModel!.assignBranchPickupList!));
    }
    //await getRiderPickupStatusList();
    notifyListeners();
  }

  void tempBoolListMaker(int picklen) {
    for (int i = 0; i < merchantDataList.length; i++) {
      List<bool> temp = [];
      for (int j = 0; j < picklen; j++) {
        print("bool adding123");
        temp.add(false);
      }
      if (temp.isNotEmpty) {
        merchantBools.add([...temp]);
      }

      temp.clear();
      print("bool addinglength 123" + merchantBools.length.toString());
    }
    print("pickbools:" + merchantBools.toString());
    notifyListeners();
  }

  productInfoMapMaker(String info) {
    var properties = json.decode(info);
    return properties;
  }

  //get pickup

  getRiderPickupStatusList() async {
    assignBranchPickupList = [];
    riderPickUpStatusModel =
        await MarchantResponse().getMerchantPickupReturnList(phone: USER_PHONE);
    assignBranchPickupList!
        .addAll(riderPickUpStatusModel!.assignBranchPickupList!);
    notifyListeners();
  }

  getMerchantPickupStatusList() async {
    statusPickupList = [];
    statusList = await MarchantResponse().getMerchantPickupStatusList();
    statusPickupList!.addAll(statusList!.statusPickupList!);

    log('status len : ' + statusPickupList!.length.toString());
    notifyListeners();
  }

  saveDelivery(
      {required String pickupId,
      required String statusId,
      required BuildContext context}) async {
    log('${await SharedPref().getString(ACCESS_TOKEN)}');
    EasyLoading.show();
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
      'pickup_data': '[{"pickup_id":$pickupId,"i_delivery_status_id_18":3,"remarks":"test2"}]'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getMarchantList();
      await getRiderPickupStatusList();
      await getMerchantPickupStatusList();
      // await getDeliveryStatusList();
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
