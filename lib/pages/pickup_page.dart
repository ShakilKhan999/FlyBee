import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/utils/colors.dart';
import 'package:flybee/utils/shared_preference.dart';
import 'package:provider/provider.dart';
import '../api_helper/account_response.dart';
import '../models/merchant_pickup_model.dart';
import '../providers/marchant_provider.dart';
import 'item_details.dart';

class PickUpPage extends StatefulWidget {
  static const String routeName = '/pickup';

  const PickUpPage({Key? key}) : super(key: key);

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> with TickerProviderStateMixin {
  late MarchantProvider marchantProvider;
  late TabController _tabController;
 // bool isExpanded = false;
  bool allSelected = false;
  bool singleChk = false;
  int selectedindex=-1;
  List<bool> chkList = [];
  List<bool> expandbools=[];
  List<bool> pickupbools=[];

  List<bool> generateBoolList(int length) {
    return List<bool>.filled(length, false);
  }
  List<bool> generatPickupeBoolList(int length) {
    return List<bool>.filled(length, false);
  }
  Future<void> refreshData() async {
    setState(() {
      getData();
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  getData() async {
    pickupbools= await generatPickupeBoolList(0);
    print("bools:"+expandbools.toString());
    marchantProvider = Provider.of<MarchantProvider>(context, listen: false);
    await marchantProvider.getMarchantList();
    await marchantProvider.getRiderPickupStatusList();
    await marchantProvider.getMerchantPickupStatusList();
    expandbools = generateBoolList(marchantProvider.marchantList.length);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  int openIndex = -1;

  List data = [
    {
      'name': 'Marchant 1',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
        {
          'item_name': 'item 4',
          'item_price': '20',
        },
        {
          'item_name': 'item 5',
          'item_price': '20',
        },
      ],
    },
    {
      'name': 'Marchant 2',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
        {
          'item_name': 'item 4',
          'item_price': '20',
        },
      ],
    },
    {
      'name': 'Marchant 3',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
      ],
    },
    {
      'name': 'Marchant 4',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
        {
          'item_name': 'item 4',
          'item_price': '20',
        },
        {
          'item_name': 'item 5',
          'item_price': '20',
        },
        {
          'item_name': 'item 6',
          'item_price': '20',
        },
      ],
    },
  ];
  
  List<AssignBranchPickupList>? itemList = [];
  pickupList(int ind) async{
    itemList=[];
    pickupbools=[];
    print("calledind012"+ind.toString());
    await marchantProvider.getPickupfromMerchant(ind);
    itemList = marchantProvider
        .merchantDataList[ind].assignBranchPickupList!
        .cast<AssignBranchPickupList>();
    marchantProvider.tempBoolListMaker(itemList!.length);
    pickupbools=generatPickupeBoolList(itemList!.length);
    print("pickboolshere: "+pickupbools.toString());
    print("item012"+itemList!.length.toString());
  }
  final GlobalKey expansionTile = new GlobalKey();
  @override
  Widget build(BuildContext context) {


    _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: logoblue,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            indicatorColor: logoblue,
            tabs: const [
              Tab(text: 'Pickup Assign'),
              Tab(text: 'Return Assign'),
              Tab(text: 'Status'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-230.h,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height-230.h,
                      child: Consumer<MarchantProvider>(
                        builder: (context, provider, child) {
                          if (provider.marchantList.isNotEmpty) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: RefreshIndicator(
                                onRefresh: refreshData,
                                child: ListView.separated(
                                  shrinkWrap: false,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: provider.marchantList.length,
                                  separatorBuilder: (context, index) => const SizedBox(
                                    height: 5,
                                  ),
                                  itemBuilder: (context, index) {
                                    //int serial = 0;
                                    // itemList = provider
                                    //     .merchantDataList[index].assignBranchPickupList!
                                    //     .cast<AssignBranchPickupList>();
                                    return InkWell(
                                      onTap: ()async{
                                        expandbools[index]=expandbools[index]==true?false:true;
                                        // itemList!.clear();
                                        setState(() {
                                          selectedindex=index;
                                        });
                                        if(expandbools[index]==true)
                                        {
                                          await pickupList(index);
                                        }

                                      },
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        child:AnimatedContainer(
                                          duration: Duration(microseconds: 2),
                                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  provider.marchantList[index].userName! ??
                                                      'N/A',
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 1,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                                subtitle: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Phone: ${provider.marchantList[index].userPhone!}',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                    Text(
                                                      'Address: ${provider.marchantList[index].address!}',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w500),
                                                    ),

                                                    Text(
                                                      'Item Count : ${provider.marchantList[index].pickupOrderCount!}',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                trailing: IconButton(onPressed:null,icon: Icon(Icons.arrow_drop_down),),
                                              ),
                                              selectedindex==index && expandbools[index]==true?Padding(
                                                padding: EdgeInsets.all(10),
                                                      // elevation: 3,
                                                      // shape: RoundedRectangleBorder(
                                                      //     borderRadius: BorderRadius.circular(10)),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text('Select all'),
                                                              Checkbox(
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    allSelected =
                                                                    !allSelected;
                                                                    // marchantProvider.merchantBools[index][serial]=true;
                                                                  });
                                                                },
                                                                value: allSelected,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            child: ListView.builder(
                                                              itemCount: itemList!.length,
                                                              shrinkWrap: true,
                                                              physics: NeverScrollableScrollPhysics(),
                                                              itemBuilder: (BuildContext context, int serial) {
                                                                var item=itemList![serial];
                                                                return Consumer<MarchantProvider>(
                                                                    builder: (context, marchantProvider, _) {
                                                                     // marchantProvider.getPickupfromMerchant(serial);
                                                                      return Column(
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.end,
                                                                        children: [

                                                                          // serial == 1
                                                                          //     ? Container(
                                                                          //   height: 50,
                                                                          //   child: Row(
                                                                          //     mainAxisAlignment:
                                                                          //     MainAxisAlignment.end,
                                                                          //     children: [
                                                                          //       Text('Select All'),
                                                                          //       Checkbox(
                                                                          //         onChanged: (value) {
                                                                          //           setState(() {
                                                                          //             allSelected =
                                                                          //             !allSelected;
                                                                          //              marchantProvider.merchantBools[index][serial]=true;
                                                                          //           });
                                                                          //         },
                                                                          //         value: allSelected,
                                                                          //       ),
                                                                          //     ],
                                                                          //   ),
                                                                          // )
                                                                          //     : Container(),
                                                                          Padding(
                                                                            padding:
                                                                            const EdgeInsets.only(left: 15.0),
                                                                            child: ListTile(
                                                                              style: ListTileStyle.list,
                                                                              contentPadding:
                                                                              const EdgeInsets.symmetric(
                                                                                  horizontal: 16),
                                                                              // leading: Checkbox(onChanged: (bool? value) {  }, value: false,),
                                                                              trailing: Container(
                                                                                height: 20,
                                                                                width: 20,
                                                                                child: Checkbox(
                                                                                  onChanged: (value) {
                                                                                    setState(() {
                                                                                      pickupbools[serial]=
                                                                                      pickupbools[serial]==true?false:true;
                                                                                      singleChk = singleChk
                                                                                          ? false
                                                                                          : true;
                                                                                      // print(checkboxValues[0]);

                                                                                    });
                                                                                  },
                                                                                  value: allSelected == true
                                                                                      ? allSelected
                                                                                      : pickupbools[serial],
                                                                                ),
                                                                              ),
                                                                              title: SizedBox(
                                                                                child: Row(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      "${serial+1}.  ",
                                                                                      style: const TextStyle(
                                                                                          fontWeight:
                                                                                          FontWeight.bold),
                                                                                    ),
                                                                                    Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                              color: logogold
                                                                                                  .withOpacity(0.4),
                                                                                              border: Border.all(),
                                                                                              borderRadius:
                                                                                              BorderRadius
                                                                                                  .circular(12)),
                                                                                          child: Padding(
                                                                                            padding:
                                                                                            const EdgeInsets.all(
                                                                                                2.0),
                                                                                            child: Column(
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisAlignment:
                                                                                                  MainAxisAlignment
                                                                                                      .spaceBetween,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          const Icon(
                                                                                                            Icons
                                                                                                                .emoji_people,
                                                                                                            color:
                                                                                                            logoblue,
                                                                                                          ),
                                                                                                          const Text(
                                                                                                            "Customer Name: ",
                                                                                                            style: TextStyle(
                                                                                                                color:
                                                                                                                logoblue,
                                                                                                                fontWeight:
                                                                                                                FontWeight.w500),
                                                                                                          ),
                                                                                                          Text(
                                                                                                              "${item.recipientName21}",
                                                                                                              style: const TextStyle(
                                                                                                                  color:
                                                                                                                  logoblue,
                                                                                                                  fontWeight:
                                                                                                                  FontWeight.w500))
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      child: Row(
                                                                                                        children: [
                                                                                                          const Icon(
                                                                                                              Icons
                                                                                                                  .phone,
                                                                                                              color:
                                                                                                              logoblue),
                                                                                                          const Text(
                                                                                                              "Customer Phone: ",
                                                                                                              style: TextStyle(
                                                                                                                  color:
                                                                                                                  logoblue,
                                                                                                                  fontWeight:
                                                                                                                  FontWeight.w500)),
                                                                                                          Text(
                                                                                                              "${item.recipientPhone20}",
                                                                                                              style: const TextStyle(
                                                                                                                  color:
                                                                                                                  logoblue,
                                                                                                                  fontWeight:
                                                                                                                  FontWeight.w500))
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        const Icon(
                                                                                                            Icons
                                                                                                                .numbers,
                                                                                                            color:
                                                                                                            logoblue),
                                                                                                        const Text(
                                                                                                            "Invoice: ",
                                                                                                            style: TextStyle(
                                                                                                                color:
                                                                                                                logoblue,
                                                                                                                fontWeight:
                                                                                                                FontWeight.w500)),
                                                                                                        Text(
                                                                                                            "${item.id}",
                                                                                                            style: const TextStyle(
                                                                                                                color:
                                                                                                                logoblue,
                                                                                                                fontWeight:
                                                                                                                FontWeight.w500))
                                                                                                      ],
                                                                                                    )
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        )),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              dense: true,
                                                                              onTap: () {

                                                                              },
                                                                            ),
                                                                          ),
                                                                          serial == itemList!.length-1
                                                                              ? Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              ElevatedButton(
                                                                                  onPressed: () async{
                                                                                    if(allSelected==true)
                                                                                      {
                                                                                        for(int i=0;i<=serial;i++)
                                                                                          {
                                                                                            print("loop started for :"+i.toString());
                                                                                            await provider.saveDelivery(pickupId: itemList![i].id.toString(), statusId: '4',context: context
                                                                                            );
                                                                                           // Future.delayed(Duration(milliseconds: 100));
                                                                                            //await pickupList(index);
                                                                                          }
                                                                                        pickupList(index);

                                                                                      }
                                                                                    else if(allSelected==false)
                                                                                      {
                                                                                        for (int i = 0; i <=serial;i++) {
                                                                                          if (pickupbools[i]) {
                                                                                            await provider.saveDelivery(pickupId: provider.merchantDataList[index]
                                                                                                .assignBranchPickupList![i].id.toString(), statusId: '4',context: context

                                                                                            );
                                                                                          }
                                                                                        }
                                                                                        pickupList(index);
                                                                                      }

                                                                                  },
                                                                                  child: Text(
                                                                                      'Collect Pickup')),
                                                                            ],
                                                                          )
                                                                              : Container()
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ):SizedBox()

                                            ],
                                          ),
                                        ),
                                      ),
                                    );

                                    // Text('${deptData[index]['name']}');
                                  },
                                ),
                              ),
                            );
                          } else {
                            return const Center(child: Text('Pick up list is empty'));
                          }
                        },
                      ),
                    ),
                  ),
                ),


                Consumer<MarchantProvider>(
                  builder: (context, provider, child) {
                    if (provider.assignBranchPickupList!.isNotEmpty) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: provider.assignBranchPickupList!.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemBuilder: (context, index) {
                            int serial = 0;
                            // itemList = provider.assignBranchPickupList.length
                            //     .cast<AssignBranchPickupList>();
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ExpansionTile(
                                iconColor: logoblue,
                                collapsedIconColor: logogold,
                                onExpansionChanged: (value) {
                                  // setState(() {
                                  //   isExpanded =
                                  //   isExpanded == false ? true : false;
                                  //   print(isExpanded);
                                  // });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                title: Text(
                                  provider.assignBranchPickupList![index]
                                          .senderName6! ??
                                      'N/A',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Phone: ${provider.assignBranchPickupList![index].senderPhone5}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Address: ${provider.assignBranchPickupList![index].senderAddress9}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Invoice: ${provider.assignBranchPickupList![index].id}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5.h,),
                                    Center(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            provider.saveDelivery(
                                              pickupId: provider
                                                  .assignBranchPickupList![index]
                                                  .id
                                                  .toString(),
                                              statusId: '8',
                                                context: context
                                            );
                                          },
                                          child: const Text('Collect Return')),
                                    ),
                                  ],
                                ),

                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(
                        child:
                            const Center(child: Text('Retuen assign list is empty')),
                      );
                    }
                  },
                ),

                Consumer<MarchantProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: provider.statusPickupList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: _buildPickUpStatusItem(index, provider),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickUpStatusItem(int index, MarchantProvider provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.sp),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: ListTile(
            style: ListTileStyle.list,
            contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),
            leading: const Icon(Icons.hail),
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Pick-Up Status",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
               provider.statusPickupList![index].id != null ? Text('Invoice: ' +
                    provider.statusPickupList![index].id!.toString()) : Text('Invoice: N/A')
              ],
            ),
            dense: true,
            onTap: () {
             
            },
          ),
        
          children: [
            
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Invoice'),
                          Row(
                            children: [
                              Icon(
                                Icons.numbers,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider.statusPickupList![index].id
                                    .toString()!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Pickup Status'),
                          Row(
                            children: [
                              Icon(
                                provider.statusPickupList![index].iDeliveryStatus!.iDeliveryStatus != null
                                    ? Icons.done
                                    : Icons.cancel,
                                size: 22.0,
                              ),
                              Expanded(
                                child: Text(
                                  provider.statusPickupList![index].iDeliveryStatus!.iDeliveryStatus != null
                                      ? 'Received'
                                      : 'Pending',
                                ),
                              ),
                            ],
                          ),

                          const Text('Marchant Name'),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider
                                    .statusPickupList![index].senderName6!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Marchant Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider
                                    .statusPickupList![index].senderAddress9!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Marchant Phone'),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider
                                    .statusPickupList![index].senderPhone5!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Marchant Branch'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider.statusPickupList![index]
                                    .currentBranch!.branch
                                    .toString()),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Marchant Invoice'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: provider
                                    .statusPickupList![index].merchantInvoice != null ? Text(provider
                                    .statusPickupList![index].merchantInvoice!) : Text('N/A'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Customer Name'),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider
                                    .statusPickupList![index].recipientName21!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Customer Phone'),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider.statusPickupList![index]
                                    .recipientPhone20!),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Customer Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.home,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider.statusPickupList![index]
                                    .recipientAddress24!),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  //   decoration: const BoxDecoration(
                  //       border: Border(
                  //     bottom: BorderSide(
                  //       color: Colors.black,
                  //       width: 0.5,
                  //     ),
                  //   )),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text('Order Pickup Time'),
                  //           Row(
                  //             children: [
                  //               Icon(
                  //                 Icons.access_time,
                  //                 size: 22.sp,
                  //               ),
                  //               SizedBox(
                  //                 width: 8.w,
                  //               ),
                  //               Text('8am',
                  //                   style: TextStyle(
                  //                       fontSize: 18.sp, color: Colors.black))
                  //             ],
                  //           ),
                  //         ],
                  //       )),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
