import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../api_helper/account_response.dart';
import '../utils/shared_preference.dart';

class AccountProvider extends ChangeNotifier{

  Map<String, dynamic> commissionsMap = {};
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


}