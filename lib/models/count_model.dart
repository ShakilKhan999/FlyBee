import 'dart:convert';

CountModel countModelFromJson(String str) => CountModel.fromJson(json.decode(str));

String countModelToJson(CountModel data) => json.encode(data.toJson());

class CountModel {
  int? pickupAssignCount;
  int? totalPickupReceivedCount;
  int? pickupReturnAssignCount;
  int? totalPickupReturnReceivedCount;
  int? deliveryAssignCount;
  int? holdCount;
  int? totalDeliveredCount;

  CountModel({
    this.pickupAssignCount,
    this.totalPickupReceivedCount,
    this.pickupReturnAssignCount,
    this.totalPickupReturnReceivedCount,
    this.deliveryAssignCount,
    this.holdCount,
    this.totalDeliveredCount,
  });

  factory CountModel.fromJson(Map<String, dynamic> json) => CountModel(
    pickupAssignCount: json["pickup_assign_count"],
    totalPickupReceivedCount: json["total_pickup_received_count"],
    pickupReturnAssignCount: json["pickup_return_assign_count"],
    totalPickupReturnReceivedCount: json["total_pickup_return_received_count"],
    deliveryAssignCount: json["delivery_assign_count"],
    holdCount: json["hold_count"],
    totalDeliveredCount: json["total_delivered_count"],
  );

  Map<String, dynamic> toJson() => {
    "pickup_assign_count": pickupAssignCount,
    "total_pickup_received_count": totalPickupReceivedCount,
    "pickup_return_assign_count": pickupReturnAssignCount,
    "total_pickup_return_received_count": totalPickupReturnReceivedCount,
    "delivery_assign_count": deliveryAssignCount,
    "hold_count": holdCount,
    "total_delivered_count": totalDeliveredCount,
  };
}
