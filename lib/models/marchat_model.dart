import 'dart:convert';

MarchantModel marchantModelFromJson(String str) => MarchantModel.fromJson(json.decode(str));
String marchantModelToJson(MarchantModel data) => json.encode(data.toJson());

class MarchantModel {
    bool? success;
    List<RiderMerchant>? riderMerchants;

    MarchantModel({
        this.success,
        this.riderMerchants,
    });

    factory MarchantModel.fromJson(Map<String, dynamic> json) => MarchantModel(
        success: json["success"],
        riderMerchants: json["rider_merchants"] == null ? [] : List<RiderMerchant>.from(json["rider_merchants"]!.map((x) => RiderMerchant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "rider_merchants": riderMerchants == null ? [] : List<dynamic>.from(riderMerchants!.map((x) => x.toJson())),
    };
}

class RiderMerchant {
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
    String? employeeId;
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
    String? paymentType;
    String? operatorNumber;
    String? bankName;
    String? accountName;
    String? accountNumber;
    String? routingNumber;
    String? nidFront;
    String? nidBack;
    dynamic files;
    String? branchId;
    int? deliveryCostPackagesIdF;
    dynamic riderCommissionPackagesIdF;
    dynamic pickupOrderCount;

    RiderMerchant({
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
        this.pickupOrderCount
    });

    factory RiderMerchant.fromJson(Map<String, dynamic> json) => RiderMerchant(
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
        pickupOrderCount: json["pickup_order_count"],
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
        "pickup_order_count": pickupOrderCount,
    };
}
