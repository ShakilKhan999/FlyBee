class user_model {
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
  List<SenderZoneDistricts>? senderZoneDistricts;

  user_model(
      {this.success,
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
        this.senderZoneDistricts});

  user_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['getUser'] != null) {
      getUser = <GetUser>[];
      json['getUser'].forEach((v) {
        getUser!.add(new GetUser.fromJson(v));
      });
    }
    accessToken = json['accessToken'];
    userId1 = json['userId1'];
    if (json['branch'] != null) {
      branch = <Branch>[];
      json['branch'].forEach((v) {
        branch!.add(new Branch.fromJson(v));
      });
    }
    firstBranch = json['first_branch'];
    isAllBranch = json['is_all_branch'];
    isDeliveryBoy = json['is_delivery_boy'];
    isMarchant = json['is_marchant'];
    isPickup = json['is_pickup'];
    isScanPod = json['is_scan_pod'];
    isUpdateStatus = json['is_update_status'];
    isQuickStatus = json['is_quick_status'];
    isAllReport = json['is_all_report'];
    isSetupConf = json['is_setup_conf'];
    userType = json['user_type'];
    if (json['sender_zone_districts'] != null) {
      senderZoneDistricts = <SenderZoneDistricts>[];
      json['sender_zone_districts'].forEach((v) {
        senderZoneDistricts!.add(new SenderZoneDistricts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.getUser != null) {
      data['getUser'] = this.getUser!.map((v) => v.toJson()).toList();
    }
    data['accessToken'] = this.accessToken;
    data['userId1'] = this.userId1;
    if (this.branch != null) {
      data['branch'] = this.branch!.map((v) => v.toJson()).toList();
    }
    data['first_branch'] = this.firstBranch;
    data['is_all_branch'] = this.isAllBranch;
    data['is_delivery_boy'] = this.isDeliveryBoy;
    data['is_marchant'] = this.isMarchant;
    data['is_pickup'] = this.isPickup;
    data['is_scan_pod'] = this.isScanPod;
    data['is_update_status'] = this.isUpdateStatus;
    data['is_quick_status'] = this.isQuickStatus;
    data['is_all_report'] = this.isAllReport;
    data['is_setup_conf'] = this.isSetupConf;
    data['user_type'] = this.userType;
    if (this.senderZoneDistricts != null) {
      data['sender_zone_districts'] =
          this.senderZoneDistricts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetUser {
  int? userID;
  String? userName;
  Null? accessClient;
  Null? branchCode;
  String? userPass;
  String? firstName;
  String? lastName;
  String? address;
  String? userEmail;
  String? userPhone;
  Null? mobile;
  int? userType;
  String? employeeId;
  Null? createDate;
  String? tblUsersUserStatus;
  Null? userStatus;
  int? isKey;
  String? tokenCode;
  String? image;
  String? modified;
  String? creator;
  String? modifier;
  String? created;
  Null? tenderBooks;
  int? zoneDivisionsId;
  int? zoneDistrictsId;
  int? zoneUpazilasId;
  Null? paymentType;
  Null? operatorNumber;
  Null? bankName;
  Null? accountName;
  Null? accountNumber;
  Null? routingNumber;
  Null? nidFront;
  Null? nidBack;
  Null? files;
  String? branchId;

  GetUser(
      {this.userID,
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
        this.branchId});

  GetUser.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    accessClient = json['access_client'];
    branchCode = json['branch_code'];
    userPass = json['userPass'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    userEmail = json['userEmail'];
    userPhone = json['userPhone'];
    mobile = json['mobile'];
    userType = json['userType'];
    employeeId = json['employee_id'];
    createDate = json['create_date'];
    tblUsersUserStatus = json['tbl_users_userStatus'];
    userStatus = json['userStatus'];
    isKey = json['is_key'];
    tokenCode = json['tokenCode'];
    image = json['image'];
    modified = json['modified'];
    creator = json['creator'];
    modifier = json['modifier'];
    created = json['created'];
    tenderBooks = json['tender_books'];
    zoneDivisionsId = json['zone_divisions_id'];
    zoneDistrictsId = json['zone_districts_id'];
    zoneUpazilasId = json['zone_upazilas_id'];
    paymentType = json['payment_type'];
    operatorNumber = json['operator_number'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    routingNumber = json['routing_number'];
    nidFront = json['nid_front'];
    nidBack = json['nid_back'];
    files = json['files'];
    branchId = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['access_client'] = this.accessClient;
    data['branch_code'] = this.branchCode;
    data['userPass'] = this.userPass;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['userEmail'] = this.userEmail;
    data['userPhone'] = this.userPhone;
    data['mobile'] = this.mobile;
    data['userType'] = this.userType;
    data['employee_id'] = this.employeeId;
    data['create_date'] = this.createDate;
    data['tbl_users_userStatus'] = this.tblUsersUserStatus;
    data['userStatus'] = this.userStatus;
    data['is_key'] = this.isKey;
    data['tokenCode'] = this.tokenCode;
    data['image'] = this.image;
    data['modified'] = this.modified;
    data['creator'] = this.creator;
    data['modifier'] = this.modifier;
    data['created'] = this.created;
    data['tender_books'] = this.tenderBooks;
    data['zone_divisions_id'] = this.zoneDivisionsId;
    data['zone_districts_id'] = this.zoneDistrictsId;
    data['zone_upazilas_id'] = this.zoneUpazilasId;
    data['payment_type'] = this.paymentType;
    data['operator_number'] = this.operatorNumber;
    data['bank_name'] = this.bankName;
    data['account_name'] = this.accountName;
    data['account_number'] = this.accountNumber;
    data['routing_number'] = this.routingNumber;
    data['nid_front'] = this.nidFront;
    data['nid_back'] = this.nidBack;
    data['files'] = this.files;
    data['branch_id'] = this.branchId;
    return data;
  }
}

class Branch {
  int? branchId;
  String? branch;

  Branch({this.branchId, this.branch});

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['branch'] = this.branch;
    return data;
  }
}

class SenderZoneDistricts {
  String? zoneDistricts;

  SenderZoneDistricts({this.zoneDistricts});

  SenderZoneDistricts.fromJson(Map<String, dynamic> json) {
    zoneDistricts = json['zone_districts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone_districts'] = this.zoneDistricts;
    return data;
  }
}