import 'package:flybee/models/marchat_model.dart';
import 'package:flybee/models/merchant_pickup_model.dart';

class MerchantDataModel {
  MarchantModel? marchantModel;
  List<AssignBranchPickupList>? assignBranchPickupList;
  MerchantDataModel(
    this.marchantModel,
    this.assignBranchPickupList,
  );
}
