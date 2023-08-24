import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flybee/customs/custom_toast.dart';
import 'package:flybee/models/count_model.dart';
import 'package:provider/provider.dart';

import '../api_helper/account_response.dart';
import '../utils/shared_preference.dart';

class AccountProvider extends ChangeNotifier{

  Map<String, dynamic> commissionsMap = {};
  CountModel? countMap;
  double collectionammount=0;

  Future<double> getCollectionAmmount(String date)async {
    EasyLoading.show();
    print("called123");
    String? actoken=await SharedPref().getString(ACCESS_TOKEN);
    String? id=await SharedPref().getString(USER_ID);
    String? branchid=await SharedPref().getString(BRANCH_ID);
    collectionammount=await AccountResponse().fetchCollectionAmount(actoken!,id!,branchid!,date);
    print("collection123"+collectionammount.toString());
    EasyLoading.dismiss();
    notifyListeners();
    return collectionammount;
  }
  void getComissions()async {
    print("called123");
    String? actoken=await SharedPref().getString(ACCESS_TOKEN);
    String? id=await SharedPref().getString(USER_ID);
    String? branchid=await SharedPref().getString(BRANCH_ID);
    commissionsMap=await AccountResponse().getCommissions(actoken!,id!,branchid!);
     print("jontrona"+commissionsMap['sum_pickup_rider_amount'].toString());
    commissionCalculator('');
    notifyListeners();
  }
    Future<CountModel> getCountData() async {
    countMap = await AccountResponse().getCountData();
    notifyListeners();
    return countMap!;
  }
  bool isInteger(String input) {
    return int.tryParse(input) != null;
  }
  commissionCalculator(String info){
    int calculatedData=0;
    int pickammount=isInteger(commissionsMap['sum_pickup_rider_amount'].toString())?
    int.parse(commissionsMap['sum_pickup_rider_amount'].toString()):0;

    int pickwithdrow=isInteger(commissionsMap['sum_pickup_withdraw_rider_amount'].toString())?
    int.parse(commissionsMap['sum_pickup_withdraw_rider_amount'].toString()):0;

    int delammount=isInteger(commissionsMap['sum_delivery_rider_amount'].toString())?
    int.parse(commissionsMap['sum_delivery_rider_amount'].toString()):0;

    int delwithdrow=isInteger(commissionsMap['sum_delivery_withdraw_rider_amount'].toString())?
    int.parse(commissionsMap['sum_delivery_withdraw_rider_amount'].toString()):0;


    print("commissions123"+pickammount.toString()+'  '+pickwithdrow.toString()+"  "+delwithdrow.toString()+'  '+delammount.toString());

    if(info=='paid')
      {
        calculatedData=pickwithdrow+delwithdrow;
      }
    else if(info=='due')
      {
        calculatedData=(pickammount-pickwithdrow)+(delammount-delwithdrow);
      }
    else if(info=='total')
      {
        calculatedData=pickammount+delammount;
      }
    else {
      calculatedData=0;
    }
    return calculatedData;
  }

  Future<void> updateProfile(String uName, String fName, String lName, String address, String email, String phn) async{
    String? actoken=await SharedPref().getString(ACCESS_TOKEN);
    String? id=await SharedPref().getString(USER_ID);
    String? branchid=await SharedPref().getString(BRANCH_ID);
    await AccountResponse().updateRiderProfile(
        actoken!,
        id!,
        branchid!,
        uName,
        fName,
        lName,
        address,
        email,
        phn);

    await SharedPref().setString(USER_ADDRESS, address);
    await SharedPref().setString(USER_EMAIL, email);
    await SharedPref().setString(USER_NAME, uName);
    await SharedPref().setString(USER_PHONE, phn);

    Fluttertoast.showToast(
      msg: "Profile Edited",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> changePass(String oldPass,String newPass)async{
    String? actoken=await SharedPref().getString(ACCESS_TOKEN);
    String? id=await SharedPref().getString(USER_ID);
    await AccountResponse().changePassword(actoken!, id!, oldPass, newPass);

  }

  bool isEmailFormatValid(String email) {
    // Regular expression pattern to validate email format
    final pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);

    // Check if the email matches the regular expression pattern
    return !regExp.hasMatch(email);
  }

}