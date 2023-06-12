import 'package:flybee/models/delivery_model.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:http/http.dart' as http;

class DeliveryResponse {
  Future<DeliveryModel?> getDeliveryList() async {
    var headers = {
      'accesstoken':
          'Bearer ${await SharedPref().getString(ACCESS_TOKEN)}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('http://starxpress.online/api/rider_delivery_list'));
    request.bodyFields = {'rider_user_id': '126'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return deliveryModelFromJson(await response.stream.bytesToString());
    } else {
      return null;
    }
  }
}
