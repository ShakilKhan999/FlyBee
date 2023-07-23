import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flybee/api_helper/marchat_response.dart';
import 'package:flybee/models/Merchant_data_model.dart';
import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';
import 'package:flybee/models/rider_pickup_status_model.dart';
import 'package:flybee/models/rider_pickup_assign_model.dart';
import 'package:intl/intl.dart';

import '../utils/shared_preference.dart';
import 'package:http/http.dart' as http;

class MarchantProvider extends ChangeNotifier {
  MarchantModel? marchantModel;
  List<RiderMerchant> marchantList = [];

  MerchantPickUpModel? merchantPickUpModel;
  List<MerchantDataModel> merchantDataList = [];

  MerchantPickUpModel? riderPickUpStatusModel;
  List<StatusPickupList>? statusPickupList;



  List<bool> pickupBools=[];
  List<List<bool>> merchantBools=[];
  List<AssignBranchPickupList>? assignBranchPickupList;




  getMarchantList() async {
    marchantList = [];
    merchantDataList = [];
    EasyLoading.show();
    marchantModel = await MarchantResponse().getMarchantList();
    marchantList.addAll(marchantModel!.riderMerchants!);

    for (int i = 0; i < marchantList.length; i++) {
      merchantPickUpModel = await MarchantResponse().getMerchantPickupList(phone: marchantList[i].userPhone!);
      if (merchantPickUpModel != null) {
      
        merchantDataList.add(MerchantDataModel(
            marchantModel, merchantPickUpModel!.assignBranchPickupList!));
      }
    }
     tempBoolListMaker();
    print(merchantBools);
    await getRiderPickupStatusList();
    EasyLoading.dismiss();
    notifyListeners();
  }

  void tempBoolListMaker() {
    for (int i = 0; i < merchantDataList.length; i++) {
      List<bool> temp = [];
      for (int j = 0; j < merchantDataList[i].assignBranchPickupList!.length; j++) {
        print("bool adding123");
        temp.add(false);
      }
      if(temp.isNotEmpty)
        {
          merchantBools.add([...temp]);
        }

      temp.clear();
      print("bool addinglength 123" + merchantBools.length.toString());
    }
    notifyListeners();
  }


  productInfoMapMaker(String info){
    var properties = json.decode(info);
    return properties;
  }

  getRiderPickupStatusList() async {
 assignBranchPickupList = [];
    riderPickUpStatusModel = await MarchantResponse().getMerchantPickupReturnList(phone: USER_PHONE);
    assignBranchPickupList!.addAll(riderPickUpStatusModel!.assignBranchPickupList!);
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
      'pickup_data':
          '[{"pickup_id": $pickupId,"i_delivery_status_id_18":$statusId,"remarks":"test2"}]'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await getMarchantList();
      await getRiderPickupStatusList();
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
