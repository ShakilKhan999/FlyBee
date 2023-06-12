
import 'dart:convert';

DeliveryModel deliveryModelFromJson(String str) => DeliveryModel.fromJson(json.decode(str));

String deliveryModelToJson(DeliveryModel data) => json.encode(data.toJson());

class DeliveryModel {
    String? riderUserId;
    List<AssignDeliveryList>? assignDeliveryList;

    DeliveryModel({
        this.riderUserId,
        this.assignDeliveryList,
    });

    factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        riderUserId: json["rider_user_id"],
        assignDeliveryList: json["assign_delivery_list"] == null ? [] : List<AssignDeliveryList>.from(json["assign_delivery_list"]!.map((x) => AssignDeliveryList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rider_user_id": riderUserId,
        "assign_delivery_list": assignDeliveryList == null ? [] : List<dynamic>.from(assignDeliveryList!.map((x) => x.toJson())),
    };
}

class AssignDeliveryList {
    int? id;
    int? servicesId1;
    int? iProductTypeId2;
    int? iPriorityId3;
    String? productInfo4;
    dynamic overwritingCost5;
    dynamic totalCost6;
    dynamic collectionAmount7;
    int? iPaymentType8;
    SenderCategory1? senderCategory1;
    PickupType2? pickupType2;
    DateTime? pickupDate3;
    String? senderRefNo4;
    String? senderPhone5;
    SenderName6? senderName6;
    dynamic senderClientId7;
    dynamic senderClientBranchId8;
    String? senderAddress9;
    int? senderCountryId10;
    int? senderDivisionId11;
    int? senderDistrictId12;
    int? senderUpazilaId13;
    RecipientCategory14? recipientCategory14;
    DeliveryType15? deliveryType15;
    int? iPackagingTypeId16;
    int? iShipmentMethodId17;
    int? iDeliveryStatusId18;
    int? iTrackingStatusId19;
    String? recipientPhone20;
    String? recipientName21;
    dynamic recipientClientId22;
    dynamic recipientClientBranchId23;
    String? recipientAddress24;
    int? recipientCountryId25;
    int? recipientDivisionId26;
    int? recipientDistrictId27;
    int? recipientUpazilaId28;
    dynamic recipientBranchId29;
    ISmsTemplateId30? iSmsTemplateId30;
    int? isTrackByRec;
    int? deliveryCostAmount;
    int? collectionAmount;
    int? codCostPercent;
    int? codCostAmount;
    int? returnCostAmount;
    String? merchantInvoice;
    int? merchantAmount;
    dynamic withdrawMerchantAmount;
    dynamic merchantToPayableUserId;
    dynamic amountToWallet;
    dynamic amountFromWallet;
    dynamic trxIds;
    int? deliveryBoyId;
    String? deliveryBoyArea;
    DateTime? deliveryBoyDate;
    DateTime? deliveryDate;
    int? deliveryCostPercent;
    dynamic pickupStatus;
    int? pickupCostPercent;
    int? pickupCostAmount;
    dynamic pickupRiderAmount;
    dynamic pickupWithdrawRiderAmount;
    dynamic pickupToPayableUserId;
    dynamic pickupBoyId;
    dynamic pickupBoyArea;
    DateTime? pickupBoyDate;
    dynamic pickupDate;
    dynamic pickupBranchId;
    dynamic deliveryRiderAmount;
    dynamic deliveryWithdrawRiderAmount;
    dynamic deliveryToPayableUserId;
    dynamic payableAmountToBranch;
    dynamic payableAmountToCentralBranch;
    dynamic payableToBranchUserId;
    dynamic payableToCentralBranchUserId;
    int? iRelationId;
    String? iRelationPerson;
    int? iReturnCauseId;
    String? uniqueUploadId;
    dynamic customerNo;
    int? currentBranchId;
    int? otp;
    dynamic otpVerified;
    int? createdBranchId;
    dynamic lastBranchId;
    dynamic created;
    dynamic modified;
    int? creator;
    dynamic modifier;
    DeliveryBoyId? assignDeliveryListDeliveryBoyId;
    IRelation? iRelation;
    IReturnCause? iReturnCause;
    ServicesClass? services;
    IProductTypeClass? iProductType;
    IPriorityClass? iPriority;
    IPaymentTypeClass? iPaymentType;
    IPackagingTypeClass? iPackagingType;
    IShipmentMethodClass? iShipmentMethod;
    IDeliveryStatusClass? iDeliveryStatus;
    ITrackingStatusClass? iTrackingStatus;
    Branch? currentBranch;
    Branch? createdBranch;
    Creator1? creator1;

    AssignDeliveryList({
        this.id,
        this.servicesId1,
        this.iProductTypeId2,
        this.iPriorityId3,
        this.productInfo4,
        this.overwritingCost5,
        this.totalCost6,
        this.collectionAmount7,
        this.iPaymentType8,
        this.senderCategory1,
        this.pickupType2,
        this.pickupDate3,
        this.senderRefNo4,
        this.senderPhone5,
        this.senderName6,
        this.senderClientId7,
        this.senderClientBranchId8,
        this.senderAddress9,
        this.senderCountryId10,
        this.senderDivisionId11,
        this.senderDistrictId12,
        this.senderUpazilaId13,
        this.recipientCategory14,
        this.deliveryType15,
        this.iPackagingTypeId16,
        this.iShipmentMethodId17,
        this.iDeliveryStatusId18,
        this.iTrackingStatusId19,
        this.recipientPhone20,
        this.recipientName21,
        this.recipientClientId22,
        this.recipientClientBranchId23,
        this.recipientAddress24,
        this.recipientCountryId25,
        this.recipientDivisionId26,
        this.recipientDistrictId27,
        this.recipientUpazilaId28,
        this.recipientBranchId29,
        this.iSmsTemplateId30,
        this.isTrackByRec,
        this.deliveryCostAmount,
        this.collectionAmount,
        this.codCostPercent,
        this.codCostAmount,
        this.returnCostAmount,
        this.merchantInvoice,
        this.merchantAmount,
        this.withdrawMerchantAmount,
        this.merchantToPayableUserId,
        this.amountToWallet,
        this.amountFromWallet,
        this.trxIds,
        this.deliveryBoyId,
        this.deliveryBoyArea,
        this.deliveryBoyDate,
        this.deliveryDate,
        this.deliveryCostPercent,
        this.pickupStatus,
        this.pickupCostPercent,
        this.pickupCostAmount,
        this.pickupRiderAmount,
        this.pickupWithdrawRiderAmount,
        this.pickupToPayableUserId,
        this.pickupBoyId,
        this.pickupBoyArea,
        this.pickupBoyDate,
        this.pickupDate,
        this.pickupBranchId,
        this.deliveryRiderAmount,
        this.deliveryWithdrawRiderAmount,
        this.deliveryToPayableUserId,
        this.payableAmountToBranch,
        this.payableAmountToCentralBranch,
        this.payableToBranchUserId,
        this.payableToCentralBranchUserId,
        this.iRelationId,
        this.iRelationPerson,
        this.iReturnCauseId,
        this.uniqueUploadId,
        this.customerNo,
        this.currentBranchId,
        this.otp,
        this.otpVerified,
        this.createdBranchId,
        this.lastBranchId,
        this.created,
        this.modified,
        this.creator,
        this.modifier,
        this.assignDeliveryListDeliveryBoyId,
        this.iRelation,
        this.iReturnCause,
        this.services,
        this.iProductType,
        this.iPriority,
        this.iPaymentType,
        this.iPackagingType,
        this.iShipmentMethod,
        this.iDeliveryStatus,
        this.iTrackingStatus,
        this.currentBranch,
        this.createdBranch,
        this.creator1,
    });

    factory AssignDeliveryList.fromJson(Map<String, dynamic> json) => AssignDeliveryList(
        id: json["id"],
        servicesId1: json["services_id_1"],
        iProductTypeId2: json["i_product_type_id_2"],
        iPriorityId3: json["i_priority_id_3"],
        productInfo4: json["product_info_4"],
        overwritingCost5: json["overwriting_cost_5"],
        totalCost6: json["total_cost_6"],
        collectionAmount7: json["collection_amount_7"],
        iPaymentType8: json["i_payment_type_8"],
        senderCategory1: senderCategory1Values.map[json["sender_category_1"]]!,
        pickupType2: pickupType2Values.map[json["pickup_type_2"]]!,
        pickupDate3: json["pickup_date_3"] == null ? null : DateTime.parse(json["pickup_date_3"]),
        senderRefNo4: json["sender_ref_no_4"],
        senderPhone5: json["sender_phone_5"],
        senderName6: senderName6Values.map[json["sender_name_6"]]!,
        senderClientId7: json["sender_client_id_7"],
        senderClientBranchId8: json["sender_client_branch_id_8"],
        senderAddress9: json["sender_address_9"],
        senderCountryId10: json["sender_country_id_10"],
        senderDivisionId11: json["sender_division_id_11"],
        senderDistrictId12: json["sender_district_id_12"],
        senderUpazilaId13: json["sender_upazila_id_13"],
        recipientCategory14: recipientCategory14Values.map[json["recipient_category_14"]]!,
        deliveryType15: deliveryType15Values.map[json["delivery_type_15"]]!,
        iPackagingTypeId16: json["i_packaging_type_id_16"],
        iShipmentMethodId17: json["i_shipment_method_id_17"],
        iDeliveryStatusId18: json["i_delivery_status_id_18"],
        iTrackingStatusId19: json["i_tracking_status_id_19"],
        recipientPhone20: json["recipient_phone_20"],
        recipientName21: json["recipient_name_21"],
        recipientClientId22: json["recipient_client_id_22"],
        recipientClientBranchId23: json["recipient_client_branch_id_23"],
        recipientAddress24: json["recipient_address_24"],
        recipientCountryId25: json["recipient_country_id_25"],
        recipientDivisionId26: json["recipient_division_id_26"],
        recipientDistrictId27: json["recipient_district_id_27"],
        recipientUpazilaId28: json["recipient_upazila_id_28"],
        recipientBranchId29: json["recipient_branch_id_29"],
        iSmsTemplateId30: iSmsTemplateId30Values.map[json["i_sms_template_id_30"]]!,
        isTrackByRec: json["is_track_by_rec"],
        deliveryCostAmount: json["delivery_cost_amount"],
        collectionAmount: json["collection_amount"],
        codCostPercent: json["cod_cost_percent"],
        codCostAmount: json["cod_cost_amount"],
        returnCostAmount: json["return_cost_amount"],
        merchantInvoice: json["merchant_invoice"],
        merchantAmount: json["merchant_amount"],
        withdrawMerchantAmount: json["withdraw_merchant_amount"],
        merchantToPayableUserId: json["merchant_to_payable_user_id"],
        amountToWallet: json["amount_to_wallet"],
        amountFromWallet: json["amount_from_wallet"],
        trxIds: json["trx_ids"],
        deliveryBoyId: json["delivery_boy_id"],
        deliveryBoyArea: json["delivery_boy_area"],
        deliveryBoyDate: json["delivery_boy_date"] == null ? null : DateTime.parse(json["delivery_boy_date"]),
        deliveryDate: json["delivery_date"] == null ? null : DateTime.parse(json["delivery_date"]),
        deliveryCostPercent: json["delivery_cost_percent"],
        pickupStatus: json["pickup_status"],
        pickupCostPercent: json["pickup_cost_percent"],
        pickupCostAmount: json["pickup_cost_amount"],
        pickupRiderAmount: json["pickup_rider_amount"],
        pickupWithdrawRiderAmount: json["pickup_withdraw_rider_amount"],
        pickupToPayableUserId: json["pickup_to_payable_user_id"],
        pickupBoyId: json["pickup_boy_id"],
        pickupBoyArea: json["pickup_boy_area"],
        pickupBoyDate: json["pickup_boy_date"] == null ? null : DateTime.parse(json["pickup_boy_date"]),
        pickupDate: json["pickup_date"],
        pickupBranchId: json["pickup_branch_id"],
        deliveryRiderAmount: json["delivery_rider_amount"],
        deliveryWithdrawRiderAmount: json["delivery_withdraw_rider_amount"],
        deliveryToPayableUserId: json["delivery_to_payable_user_id"],
        payableAmountToBranch: json["payable_amount_to_branch"],
        payableAmountToCentralBranch: json["payable_amount_to_central_branch"],
        payableToBranchUserId: json["payable_to_branch_user_id"],
        payableToCentralBranchUserId: json["payable_to_central_branch_user_id"],
        iRelationId: json["i_relation_id"],
        iRelationPerson: json["i_relation_person"],
        iReturnCauseId: json["i_return_cause_id"],
        uniqueUploadId: json["unique_upload_id"],
        customerNo: json["customer_no"],
        currentBranchId: json["current_branch_id"],
        otp: json["otp"],
        otpVerified: json["otp_verified"],
        createdBranchId: json["created_branch_id"],
        lastBranchId: json["last_branch_id"],
        created: json["created"],
        modified: json["modified"],
        creator: json["creator"],
        modifier: json["modifier"],
        assignDeliveryListDeliveryBoyId: json["delivery_boy_id_"] == null ? null : DeliveryBoyId.fromJson(json["delivery_boy_id_"]),
        iRelation: json["i_relation"] == null ? null : IRelation.fromJson(json["i_relation"]),
        iReturnCause: json["i_return_cause"] == null ? null : IReturnCause.fromJson(json["i_return_cause"]),
        services: json["services"] == null ? null : ServicesClass.fromJson(json["services"]),
        iProductType: json["i_product_type"] == null ? null : IProductTypeClass.fromJson(json["i_product_type"]),
        iPriority: json["i_priority"] == null ? null : IPriorityClass.fromJson(json["i_priority"]),
        iPaymentType: json["i_payment_type"] == null ? null : IPaymentTypeClass.fromJson(json["i_payment_type"]),
        iPackagingType: json["i_packaging_type"] == null ? null : IPackagingTypeClass.fromJson(json["i_packaging_type"]),
        iShipmentMethod: json["i_shipment_method"] == null ? null : IShipmentMethodClass.fromJson(json["i_shipment_method"]),
        iDeliveryStatus: json["i_delivery_status"] == null ? null : IDeliveryStatusClass.fromJson(json["i_delivery_status"]),
        iTrackingStatus: json["i_tracking_status"] == null ? null : ITrackingStatusClass.fromJson(json["i_tracking_status"]),
        currentBranch: json["current_branch"] == null ? null : Branch.fromJson(json["current_branch"]),
        createdBranch: json["created_branch_"] == null ? null : Branch.fromJson(json["created_branch_"]),
        creator1: json["creator1_"] == null ? null : Creator1.fromJson(json["creator1_"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "services_id_1": servicesId1,
        "i_product_type_id_2": iProductTypeId2,
        "i_priority_id_3": iPriorityId3,
        "product_info_4": productInfo4,
        "overwriting_cost_5": overwritingCost5,
        "total_cost_6": totalCost6,
        "collection_amount_7": collectionAmount7,
        "i_payment_type_8": iPaymentType8,
        "sender_category_1": senderCategory1Values.reverse[senderCategory1],
        "pickup_type_2": pickupType2Values.reverse[pickupType2],
        "pickup_date_3": "${pickupDate3!.year.toString().padLeft(4, '0')}-${pickupDate3!.month.toString().padLeft(2, '0')}-${pickupDate3!.day.toString().padLeft(2, '0')}",
        "sender_ref_no_4": senderRefNo4,
        "sender_phone_5": senderPhone5,
        "sender_name_6": senderName6Values.reverse[senderName6],
        "sender_client_id_7": senderClientId7,
        "sender_client_branch_id_8": senderClientBranchId8,
        "sender_address_9": senderAddress9,
        "sender_country_id_10": senderCountryId10,
        "sender_division_id_11": senderDivisionId11,
        "sender_district_id_12": senderDistrictId12,
        "sender_upazila_id_13": senderUpazilaId13,
        "recipient_category_14": recipientCategory14Values.reverse[recipientCategory14],
        "delivery_type_15": deliveryType15Values.reverse[deliveryType15],
        "i_packaging_type_id_16": iPackagingTypeId16,
        "i_shipment_method_id_17": iShipmentMethodId17,
        "i_delivery_status_id_18": iDeliveryStatusId18,
        "i_tracking_status_id_19": iTrackingStatusId19,
        "recipient_phone_20": recipientPhone20,
        "recipient_name_21": recipientName21,
        "recipient_client_id_22": recipientClientId22,
        "recipient_client_branch_id_23": recipientClientBranchId23,
        "recipient_address_24": recipientAddress24,
        "recipient_country_id_25": recipientCountryId25,
        "recipient_division_id_26": recipientDivisionId26,
        "recipient_district_id_27": recipientDistrictId27,
        "recipient_upazila_id_28": recipientUpazilaId28,
        "recipient_branch_id_29": recipientBranchId29,
        "i_sms_template_id_30": iSmsTemplateId30Values.reverse[iSmsTemplateId30],
        "is_track_by_rec": isTrackByRec,
        "delivery_cost_amount": deliveryCostAmount,
        "collection_amount": collectionAmount,
        "cod_cost_percent": codCostPercent,
        "cod_cost_amount": codCostAmount,
        "return_cost_amount": returnCostAmount,
        "merchant_invoice": merchantInvoice,
        "merchant_amount": merchantAmount,
        "withdraw_merchant_amount": withdrawMerchantAmount,
        "merchant_to_payable_user_id": merchantToPayableUserId,
        "amount_to_wallet": amountToWallet,
        "amount_from_wallet": amountFromWallet,
        "trx_ids": trxIds,
        "delivery_boy_id": deliveryBoyId,
        "delivery_boy_area": deliveryBoyArea,
        "delivery_boy_date": "${deliveryBoyDate!.year.toString().padLeft(4, '0')}-${deliveryBoyDate!.month.toString().padLeft(2, '0')}-${deliveryBoyDate!.day.toString().padLeft(2, '0')}",
        "delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "delivery_cost_percent": deliveryCostPercent,
        "pickup_status": pickupStatus,
        "pickup_cost_percent": pickupCostPercent,
        "pickup_cost_amount": pickupCostAmount,
        "pickup_rider_amount": pickupRiderAmount,
        "pickup_withdraw_rider_amount": pickupWithdrawRiderAmount,
        "pickup_to_payable_user_id": pickupToPayableUserId,
        "pickup_boy_id": pickupBoyId,
        "pickup_boy_area": pickupBoyArea,
        "pickup_boy_date": "${pickupBoyDate!.year.toString().padLeft(4, '0')}-${pickupBoyDate!.month.toString().padLeft(2, '0')}-${pickupBoyDate!.day.toString().padLeft(2, '0')}",
        "pickup_date": pickupDate,
        "pickup_branch_id": pickupBranchId,
        "delivery_rider_amount": deliveryRiderAmount,
        "delivery_withdraw_rider_amount": deliveryWithdrawRiderAmount,
        "delivery_to_payable_user_id": deliveryToPayableUserId,
        "payable_amount_to_branch": payableAmountToBranch,
        "payable_amount_to_central_branch": payableAmountToCentralBranch,
        "payable_to_branch_user_id": payableToBranchUserId,
        "payable_to_central_branch_user_id": payableToCentralBranchUserId,
        "i_relation_id": iRelationId,
        "i_relation_person": iRelationPerson,
        "i_return_cause_id": iReturnCauseId,
        "unique_upload_id": uniqueUploadId,
        "customer_no": customerNo,
        "current_branch_id": currentBranchId,
        "otp": otp,
        "otp_verified": otpVerified,
        "created_branch_id": createdBranchId,
        "last_branch_id": lastBranchId,
        "created": created,
        "modified": modified,
        "creator": creator,
        "modifier": modifier,
        "delivery_boy_id_": assignDeliveryListDeliveryBoyId?.toJson(),
        "i_relation": iRelation?.toJson(),
        "i_return_cause": iReturnCause?.toJson(),
        "services": services?.toJson(),
        "i_product_type": iProductType?.toJson(),
        "i_priority": iPriority?.toJson(),
        "i_payment_type": iPaymentType?.toJson(),
        "i_packaging_type": iPackagingType?.toJson(),
        "i_shipment_method": iShipmentMethod?.toJson(),
        "i_delivery_status": iDeliveryStatus?.toJson(),
        "i_tracking_status": iTrackingStatus?.toJson(),
        "current_branch": currentBranch?.toJson(),
        "created_branch_": createdBranch?.toJson(),
        "creator1_": creator1?.toJson(),
    };
}

class DeliveryBoyId {
    String? userName;
    int? userId;

    DeliveryBoyId({
        this.userName,
        this.userId,
    });

    factory DeliveryBoyId.fromJson(Map<String, dynamic> json) => DeliveryBoyId(
        userName: json["userName"],
        userId: json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "userID": userId,
    };
}

class Branch {
    BranchEnum? branch;

    Branch({
        this.branch,
    });

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branch: branchEnumValues.map[json["branch"]]!,
    );

    Map<String, dynamic> toJson() => {
        "branch": branchEnumValues.reverse[branch],
    };
}

enum BranchEnum { DHAKA_CENTRAL_HUB }

final branchEnumValues = EnumValues({
    "Dhaka (Central Hub)": BranchEnum.DHAKA_CENTRAL_HUB
});

class Creator1 {
    SenderName6? userName;

    Creator1({
        this.userName,
    });

    factory Creator1.fromJson(Map<String, dynamic> json) => Creator1(
        userName: senderName6Values.map[json["userName"]]!,
    );

    Map<String, dynamic> toJson() => {
        "userName": senderName6Values.reverse[userName],
    };
}

enum SenderName6 { BEFORE_BEAUTY, JOVIAL_THERAPY_BY_ESA, CHIA_SEED, AR_24_SHOP, ANUSHA, DAAMKOM24, QSS_FAMILY_BAZAR, RONY_GMAIL_COM }

final senderName6Values = EnumValues({
    "Anusha": SenderName6.ANUSHA,
    "AR 24 shop": SenderName6.AR_24_SHOP,
    "Before Beauty\t": SenderName6.BEFORE_BEAUTY,
    "Chia seed": SenderName6.CHIA_SEED,
    "DAAMKOM24": SenderName6.DAAMKOM24,
    "Jovial therapy by esa": SenderName6.JOVIAL_THERAPY_BY_ESA,
    "QSS Family Bazar": SenderName6.QSS_FAMILY_BAZAR,
    "rony@gmail.com": SenderName6.RONY_GMAIL_COM
});

enum DeliveryType15 { HOME_DELIVERY }

final deliveryType15Values = EnumValues({
    "home_delivery": DeliveryType15.HOME_DELIVERY
});

class IDeliveryStatusClass {
    IDeliveryStatusEnum? iDeliveryStatus;

    IDeliveryStatusClass({
        this.iDeliveryStatus,
    });

    factory IDeliveryStatusClass.fromJson(Map<String, dynamic> json) => IDeliveryStatusClass(
        iDeliveryStatus: iDeliveryStatusEnumValues.map[json["i_delivery_status"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_delivery_status": iDeliveryStatusEnumValues.reverse[iDeliveryStatus],
    };
}

enum IDeliveryStatusEnum { OUT_FOR_DELIVERY }

final iDeliveryStatusEnumValues = EnumValues({
    "Out For Delivery": IDeliveryStatusEnum.OUT_FOR_DELIVERY
});

class IPackagingTypeClass {
    IPackagingTypeEnum? iPackagingType;

    IPackagingTypeClass({
        this.iPackagingType,
    });

    factory IPackagingTypeClass.fromJson(Map<String, dynamic> json) => IPackagingTypeClass(
        iPackagingType: iPackagingTypeEnumValues.map[json["i_packaging_type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_packaging_type": iPackagingTypeEnumValues.reverse[iPackagingType],
    };
}

enum IPackagingTypeEnum { LARGE }

final iPackagingTypeEnumValues = EnumValues({
    "Large": IPackagingTypeEnum.LARGE
});

class IPaymentTypeClass {
    IPaymentTypeEnum? iPaymentType;

    IPaymentTypeClass({
        this.iPaymentType,
    });

    factory IPaymentTypeClass.fromJson(Map<String, dynamic> json) => IPaymentTypeClass(
        iPaymentType: iPaymentTypeEnumValues.map[json["i_payment_type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_payment_type": iPaymentTypeEnumValues.reverse[iPaymentType],
    };
}

enum IPaymentTypeEnum { COD }

final iPaymentTypeEnumValues = EnumValues({
    "COD": IPaymentTypeEnum.COD
});

class IPriorityClass {
    IPriorityEnum? iPriority;

    IPriorityClass({
        this.iPriority,
    });

    factory IPriorityClass.fromJson(Map<String, dynamic> json) => IPriorityClass(
        iPriority: iPriorityEnumValues.map[json["i_priority"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_priority": iPriorityEnumValues.reverse[iPriority],
    };
}

enum IPriorityEnum { GENERAL }

final iPriorityEnumValues = EnumValues({
    "General": IPriorityEnum.GENERAL
});

class IProductTypeClass {
    IProductTypeEnum? iProductType;

    IProductTypeClass({
        this.iProductType,
    });

    factory IProductTypeClass.fromJson(Map<String, dynamic> json) => IProductTypeClass(
        iProductType: iProductTypeEnumValues.map[json["i_product_type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_product_type": iProductTypeEnumValues.reverse[iProductType],
    };
}

enum IProductTypeEnum { CUSTOMER_DOCUMENT, GIFT_ITEM, COSMETICS }

final iProductTypeEnumValues = EnumValues({
    "Cosmetics": IProductTypeEnum.COSMETICS,
    "Customer Document": IProductTypeEnum.CUSTOMER_DOCUMENT,
    "Gift Item": IProductTypeEnum.GIFT_ITEM
});

class IRelation {
    String? iRelation;

    IRelation({
        this.iRelation,
    });

    factory IRelation.fromJson(Map<String, dynamic> json) => IRelation(
        iRelation: json["i_relation"],
    );

    Map<String, dynamic> toJson() => {
        "i_relation": iRelation,
    };
}

class IReturnCause {
    String? iReturnCause;

    IReturnCause({
        this.iReturnCause,
    });

    factory IReturnCause.fromJson(Map<String, dynamic> json) => IReturnCause(
        iReturnCause: json["i_return_cause"],
    );

    Map<String, dynamic> toJson() => {
        "i_return_cause": iReturnCause,
    };
}

class IShipmentMethodClass {
    IShipmentMethodEnum? iShipmentMethod;

    IShipmentMethodClass({
        this.iShipmentMethod,
    });

    factory IShipmentMethodClass.fromJson(Map<String, dynamic> json) => IShipmentMethodClass(
        iShipmentMethod: iShipmentMethodEnumValues.map[json["i_shipment_method"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_shipment_method": iShipmentMethodEnumValues.reverse[iShipmentMethod],
    };
}

enum IShipmentMethodEnum { REGULAR }

final iShipmentMethodEnumValues = EnumValues({
    "Regular": IShipmentMethodEnum.REGULAR
});

enum ISmsTemplateId30 { EMPTY, THE_1245 }

final iSmsTemplateId30Values = EnumValues({
    "": ISmsTemplateId30.EMPTY,
    "1,2,4,5": ISmsTemplateId30.THE_1245
});

class ITrackingStatusClass {
    ITrackingStatusEnum? iTrackingStatus;

    ITrackingStatusClass({
        this.iTrackingStatus,
    });

    factory ITrackingStatusClass.fromJson(Map<String, dynamic> json) => ITrackingStatusClass(
        iTrackingStatus: iTrackingStatusEnumValues.map[json["i_tracking_status"]]!,
    );

    Map<String, dynamic> toJson() => {
        "i_tracking_status": iTrackingStatusEnumValues.reverse[iTrackingStatus],
    };
}

enum ITrackingStatusEnum { ORDER_PLACED }

final iTrackingStatusEnumValues = EnumValues({
    "Order placed": ITrackingStatusEnum.ORDER_PLACED
});

enum PickupType2 { BRANCH_PICKUP }

final pickupType2Values = EnumValues({
    "branch_pickup": PickupType2.BRANCH_PICKUP
});

enum RecipientCategory14 { GENERAL_RECIPIENT }

final recipientCategory14Values = EnumValues({
    "general_recipient": RecipientCategory14.GENERAL_RECIPIENT
});

enum SenderCategory1 { GENERAL_SENDER }

final senderCategory1Values = EnumValues({
    "general_sender": SenderCategory1.GENERAL_SENDER
});

class ServicesClass {
    ServicesEnum? services;

    ServicesClass({
        this.services,
    });

    factory ServicesClass.fromJson(Map<String, dynamic> json) => ServicesClass(
        services: servicesEnumValues.map[json["services"]]!,
    );

    Map<String, dynamic> toJson() => {
        "services": servicesEnumValues.reverse[services],
    };
}

enum ServicesEnum { E_COMMERCE_SERVICE, PARCEL }

final servicesEnumValues = EnumValues({
    "E-commerce Service": ServicesEnum.E_COMMERCE_SERVICE,
    "Parcel ": ServicesEnum.PARCEL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
