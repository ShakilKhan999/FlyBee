import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';
import 'package:http/http.dart' as http;

import '../utils/shared_preference.dart';

class MarchantResponse {
  Future<MarchantModel?> getMarchantList() async {
    var headers = {
      'accesstoken': 'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('http://starxpress.online/api/rider_all_merchant'));
    request.bodyFields = {'rider_branch_id': '3'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return marchantModelFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }

  Future<MerchantPickUpModel?> getMerchantPickupList({required String phone}) async {
    var headers = {
      'accesstoken':
          'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        Uri.parse('http://starxpress.online/api/merchant_rider_pickup_list'));
    request.bodyFields = {
      'rider_user_id': '340',
      'rider_branch_id': '3',
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
}
