// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    bool? success;
    List<GetUser>? getUser;
    String? accessToken;
    int? userId1;
    List<Branch>? branch;
    String? firstBranch;
    int? isAllBranch;
    int? isDeliveryBoy;
    int? isMarchant;
    int? isPickup;
    int? isScanPod;
    int? isUpdateStatus;
    int? isQuickStatus;
    int? isAllReport;
    int? isSetupConf;
    String? userType;
    List<SenderZoneDistrict>? senderZoneDistricts;
    dynamic deliveryCostPackagesIdF;
    String? deliveryCostPackages;

    UserModel({
        this.success,
        this.getUser,
        this.accessToken,
        this.userId1,
        this.branch,
        this.firstBranch,
        this.isAllBranch,
        this.isDeliveryBoy,
        this.isMarchant,
        this.isPickup,
        this.isScanPod,
        this.isUpdateStatus,
        this.isQuickStatus,
        this.isAllReport,
        this.isSetupConf,
        this.userType,
        this.senderZoneDistricts,
        this.deliveryCostPackagesIdF,
        this.deliveryCostPackages,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        getUser: json["getUser"] == null ? [] : List<GetUser>.from(json["getUser"]!.map((x) => GetUser.fromJson(x))),
        accessToken: json["accessToken"],
        userId1: json["userId1"],
        branch: json["branch"] == null ? [] : List<Branch>.from(json["branch"]!.map((x) => Branch.fromJson(x))),
        firstBranch: json["first_branch"],
        isAllBranch: json["is_all_branch"],
        isDeliveryBoy: json["is_delivery_boy"],
        isMarchant: json["is_marchant"],
        isPickup: json["is_pickup"],
        isScanPod: json["is_scan_pod"],
        isUpdateStatus: json["is_update_status"],
        isQuickStatus: json["is_quick_status"],
        isAllReport: json["is_all_report"],
        isSetupConf: json["is_setup_conf"],
        userType: json["user_type"],
        senderZoneDistricts: json["sender_zone_districts"] == null ? [] : List<SenderZoneDistrict>.from(json["sender_zone_districts"]!.map((x) => SenderZoneDistrict.fromJson(x))),
        deliveryCostPackagesIdF: json["delivery_cost_packages_id_f"],
        deliveryCostPackages: json["delivery_cost_packages"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "getUser": getUser == null ? [] : List<dynamic>.from(getUser!.map((x) => x.toJson())),
        "accessToken": accessToken,
        "userId1": userId1,
        "branch": branch == null ? [] : List<dynamic>.from(branch!.map((x) => x.toJson())),
        "first_branch": firstBranch,
        "is_all_branch": isAllBranch,
        "is_delivery_boy": isDeliveryBoy,
        "is_marchant": isMarchant,
        "is_pickup": isPickup,
        "is_scan_pod": isScanPod,
        "is_update_status": isUpdateStatus,
        "is_quick_status": isQuickStatus,
        "is_all_report": isAllReport,
        "is_setup_conf": isSetupConf,
        "user_type": userType,
        "sender_zone_districts": senderZoneDistricts == null ? [] : List<dynamic>.from(senderZoneDistricts!.map((x) => x.toJson())),
        "delivery_cost_packages_id_f": deliveryCostPackagesIdF,
        "delivery_cost_packages": deliveryCostPackages,
    };
}

class Branch {
    int? branchId;
    String? branch;

    Branch({
        this.branchId,
        this.branch,
    });

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchId: json["branch_id"],
        branch: json["branch"],
    );

    Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "branch": branch,
    };
}

class GetUser {
    int? userId;
    String? userName;
    dynamic accessClient;
    dynamic branchCode;
    String? userPass;
    String? firstName;
    String? lastName;
    String? address;
    String? userEmail;
    String? userPhone;
    dynamic mobile;
    int? userType;
    dynamic employeeId;
    dynamic createDate;
    String? tblUsersUserStatus;
    dynamic userStatus;
    int? isKey;
    dynamic tokenCode;
    String? image;
    String? modified;
    String? creator;
    String? modifier;
    String? created;
    dynamic tenderBooks;
    int? zoneDivisionsId;
    int? zoneDistrictsId;
    int? zoneUpazilasId;
    dynamic paymentType;
    dynamic operatorNumber;
    dynamic bankName;
    dynamic accountName;
    dynamic accountNumber;
    dynamic routingNumber;
    dynamic nidFront;
    dynamic nidBack;
    dynamic files;
    String? branchId;
    dynamic deliveryCostPackagesIdF;
    int? riderCommissionPackagesIdF;

    GetUser({
        this.userId,
        this.userName,
        this.accessClient,
        this.branchCode,
        this.userPass,
        this.firstName,
        this.lastName,
        this.address,
        this.userEmail,
        this.userPhone,
        this.mobile,
        this.userType,
        this.employeeId,
        this.createDate,
        this.tblUsersUserStatus,
        this.userStatus,
        this.isKey,
        this.tokenCode,
        this.image,
        this.modified,
        this.creator,
        this.modifier,
        this.created,
        this.tenderBooks,
        this.zoneDivisionsId,
        this.zoneDistrictsId,
        this.zoneUpazilasId,
        this.paymentType,
        this.operatorNumber,
        this.bankName,
        this.accountName,
        this.accountNumber,
        this.routingNumber,
        this.nidFront,
        this.nidBack,
        this.files,
        this.branchId,
        this.deliveryCostPackagesIdF,
        this.riderCommissionPackagesIdF,
    });

    factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
        userId: json["userID"],
        userName: json["userName"],
        accessClient: json["access_client"],
        branchCode: json["branch_code"],
        userPass: json["userPass"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        mobile: json["mobile"],
        userType: json["userType"],
        employeeId: json["employee_id"],
        createDate: json["create_date"],
        tblUsersUserStatus: json["tbl_users_userStatus"],
        userStatus: json["userStatus"],
        isKey: json["is_key"],
        tokenCode: json["tokenCode"],
        image: json["image"],
        modified: json["modified"],
        creator: json["creator"],
        modifier: json["modifier"],
        created: json["created"],
        tenderBooks: json["tender_books"],
        zoneDivisionsId: json["zone_divisions_id"],
        zoneDistrictsId: json["zone_districts_id"],
        zoneUpazilasId: json["zone_upazilas_id"],
        paymentType: json["payment_type"],
        operatorNumber: json["operator_number"],
        bankName: json["bank_name"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        routingNumber: json["routing_number"],
        nidFront: json["nid_front"],
        nidBack: json["nid_back"],
        files: json["files"],
        branchId: json["branch_id"],
        deliveryCostPackagesIdF: json["delivery_cost_packages_id_f"],
        riderCommissionPackagesIdF: json["rider_commission_packages_id_f"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "userName": userName,
        "access_client": accessClient,
        "branch_code": branchCode,
        "userPass": userPass,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "userEmail": userEmail,
        "userPhone": userPhone,
        "mobile": mobile,
        "userType": userType,
        "employee_id": employeeId,
        "create_date": createDate,
        "tbl_users_userStatus": tblUsersUserStatus,
        "userStatus": userStatus,
        "is_key": isKey,
        "tokenCode": tokenCode,
        "image": image,
        "modified": modified,
        "creator": creator,
        "modifier": modifier,
        "created": created,
        "tender_books": tenderBooks,
        "zone_divisions_id": zoneDivisionsId,
        "zone_districts_id": zoneDistrictsId,
        "zone_upazilas_id": zoneUpazilasId,
        "payment_type": paymentType,
        "operator_number": operatorNumber,
        "bank_name": bankName,
        "account_name": accountName,
        "account_number": accountNumber,
        "routing_number": routingNumber,
        "nid_front": nidFront,
        "nid_back": nidBack,
        "files": files,
        "branch_id": branchId,
        "delivery_cost_packages_id_f": deliveryCostPackagesIdF,
        "rider_commission_packages_id_f": riderCommissionPackagesIdF,
    };
}

class SenderZoneDistrict {
    String? zoneDistricts;

    SenderZoneDistrict({
        this.zoneDistricts,
    });

    factory SenderZoneDistrict.fromJson(Map<String, dynamic> json) => SenderZoneDistrict(
        zoneDistricts: json["zone_districts"],
    );

    Map<String, dynamic> toJson() => {
        "zone_districts": zoneDistricts,
    };
}
