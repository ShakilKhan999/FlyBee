// To parse this JSON data, do
//
//     final addDeliveryResponse = addDeliveryResponseFromJson(jsonString);

import 'dart:convert';

AddDeliveryResponse addDeliveryResponseFromJson(String str) =>
    AddDeliveryResponse.fromJson(json.decode(str));

String addDeliveryResponseToJson(AddDeliveryResponse data) =>
    json.encode(data.toJson());

class AddDeliveryResponse {
  bool? success;
  List<String>? pickupIds;

  AddDeliveryResponse({
    this.success,
    this.pickupIds,
  });

  factory AddDeliveryResponse.fromJson(Map<String, dynamic> json) =>
      AddDeliveryResponse(
        success: json["success"],
        pickupIds: json["pickup_ids"] == null
            ? []
            : List<String>.from(json["pickup_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "pickup_ids": pickupIds == null
            ? []
            : List<dynamic>.from(pickupIds!.map((x) => x)),
      };
}
