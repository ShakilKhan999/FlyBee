import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/utils/colors.dart';
import 'package:provider/provider.dart';
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
  bool isExpanded = false;

  @override
  void initState() {
    marchantProvider = Provider.of<MarchantProvider>(context, listen: false);
    marchantProvider.getMarchantList();
    // marchantProvider.getRiderPickupStatusList();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 3, vsync: this);
    List<AssignBranchPickupList>? itemList = [];
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
              Tab(text: 'Pickup List'),
              Tab(text: 'Return'),
              Tab(text: 'Status'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Consumer<MarchantProvider>(
                  builder: (context, provider, child) {
                    if (provider.marchantList.isNotEmpty) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: provider.marchantList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemBuilder: (context, index) {
                            int serial = 0;
                            itemList = provider
                                .merchantDataList[index].assignBranchPickupList!
                                .cast<AssignBranchPickupList>();
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ExpansionTile(
                                iconColor: logoblue,
                                collapsedIconColor: logogold,
                                onExpansionChanged: (value) {
                                  setState(() {
                                    isExpanded =
                                        isExpanded == false ? true : false;
                                    print(isExpanded);
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // tilePadding:
                                //     EdgeInsets.symmetric(horizontal: 10.w),
                                //     leading: Container(
                                //       height: 20,
                                //       width: 20,
                                //       child: Checkbox(onChanged: (value) {

                                //       }, value: false,),
                                //     ),
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
                                      'Item Count : ${itemList!.length.toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                children: itemList!.map((item) {
                                  serial++;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      serial == 1
                                          ? Container(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('Select All'),
                                                  Checkbox(
                                                    onChanged: (value) {},
                                                    value: false,
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
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
                                              onChanged: (value) {},
                                              value: false,
                                            ),
                                          ),
                                          title: SizedBox(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${serial}.  ",
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
                                                          BorderRadius.circular(
                                                              12)),
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
                                                                    "${item.merchantInvoice}",
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
                                            Navigator.pushNamed(context,
                                                ItemDetailsPage.routeName);
                                          },
                                        ),
                                      ),
                                      serial == itemList!.length
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    child:
                                                        Text('Collect Pickup')),
                                              ],
                                            )
                                          : Container()
                                    ],
                                  );
                                }).toList(),
                              ),
                            );

                            // Text('${deptData[index]['name']}');
                          },
                        ),
                      );
                    } else {
                      return Container(
                        child: const Text('Pick up list is empty'),
                      );
                    }
                  },
                ),
                Consumer<MarchantProvider>(
                  builder: (context, provider, child) {
                    if (provider.marchantList.isNotEmpty) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: provider.marchantList.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                          itemBuilder: (context, index) {
                            int serial = 0;
                            itemList = provider
                                .merchantDataList[index].assignBranchPickupList!
                                .cast<AssignBranchPickupList>();
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: ExpansionTile(
                                iconColor: logoblue,
                                collapsedIconColor: logogold,
                                onExpansionChanged: (value) {
                                  setState(() {
                                    isExpanded =
                                    isExpanded == false ? true : false;
                                    print(isExpanded);
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                                      'Item Count : ${itemList!.length.toString()}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                children: itemList!.map((item) {
                                  serial++;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      serial == 1
                                          ? Container(
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            Text('Select All'),
                                            Checkbox(
                                              onChanged: (value) {},
                                              value: false,
                                            ),
                                          ],
                                        ),
                                      )
                                          : Container(),
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
                                              onChanged: (value) {},
                                              value: false,
                                            ),
                                          ),
                                          title: SizedBox(
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${serial}.  ",
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
                                                          BorderRadius.circular(
                                                              12)),
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
                                                                        "${item.merchantInvoice}",
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
                                            Navigator.pushNamed(context,
                                                ItemDetailsPage.routeName);
                                          },
                                        ),
                                      ),
                                      serial == itemList!.length
                                          ? Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              child:
                                              Text('Collect Pickup')),
                                        ],
                                      )
                                          : Container()
                                    ],
                                  );
                                }).toList(),
                              ),
                            );

                            // Text('${deptData[index]['name']}');
                          },
                        ),
                      );
                    } else {
                      return Container(
                        child: const Text('Pick up list is empty'),
                      );
                    }
                  },
                ),

                Consumer<MarchantProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 1,
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: ListTile(
            style: ListTileStyle.list,
            contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
            leading: const Icon(Icons.hail),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Pick-Up Completed",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  children: [
                    Text('Marchant number: ' +
                        provider.statusPickupList![index].merchantInvoice!),
                  ],
                )
              ],
            ),
            dense: true,
            onTap: () {
              // Navigator.pushNamed(
              //     context, ItemDetailsPage.routeName);
            },
          ),
          // subtitle: Text(provider.statusPickupList![index].senderAddress9!),
          children: [
            // SizedBox(
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "${index + 1}.  ",
            //         style: const TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       Expanded(
            //           child: Padding(
            //             padding: const EdgeInsets.all(2.0),
            //             child: Column(
            //               children: [
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Container(
            //                       child: Row(
            //                         children: [
            //                           const Icon(
            //                             Icons.price_change,
            //                             color: logoblue,
            //                           ),
            //                           const Text(
            //                             "Fixed Price: ",
            //                             style: TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                           Text(
            //                               "${provider.productInfoMapMaker(provider.statusPickupList![index].productInfo4.toString())[0]['fixed_cost']}",
            //                               style: const TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500))
            //                         ],
            //                       ),
            //                     ),
            //                     Container(
            //                       child: Row(
            //                         children: [
            //                           const Icon(Icons.price_change,
            //                               color: logoblue),
            //                           const Text("Selling Price: ",
            //                               style: TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500)),
            //                           Text(
            //                               "${provider.productInfoMapMaker(provider.statusPickupList![index].productInfo4.toString())[0]['selling_price']}",
            //                               style: const TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500))
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Container(
            //                       child: Row(
            //                         children: [
            //                           const Icon(Icons.monitor_weight_outlined,
            //                               color: logoblue),
            //                           const Text("Weight: ",
            //                               style: TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500)),
            //                           Text(
            //                               "${provider.productInfoMapMaker(provider.statusPickupList![index].productInfo4.toString())[0]['weight']}",
            //                               style: const TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500))
            //                         ],
            //                       ),
            //                     ),
            //                     Container(
            //                       child: Row(
            //                         children: [
            //                           const Icon(Icons.shopping_bag_outlined,
            //                               color: logoblue),
            //                           const Text("Quantity: ",
            //                               style: TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500)),
            //                           Text(
            //                               "${provider.productInfoMapMaker(provider.statusPickupList![index].productInfo4.toString())[0]['qty']}",
            //                               style: const TextStyle(
            //                                   color: logoblue,
            //                                   fontWeight: FontWeight.w500))
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 )
            //               ],
            //             ),
            //           )),
            //     ],
            //   ),
            // ),
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
                                Icons.cancel,
                                size: 22.sp,
                              ),
                              Expanded(
                                child: Text(provider
                                    .statusPickupList![index].pickupStatus
                                    .toString()),
                              )
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

  // Widget _buildActivePickUpItem(int index, MarchantProvider provider) {
  //   List<AssignBranchPickupList>? itemList = [];
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 8.w),
  //     child: ListView.separated(
  //       shrinkWrap: true,
  //       physics: const BouncingScrollPhysics(
  //           parent: AlwaysScrollableScrollPhysics()),
  //       itemCount: provider.marchantList.length,
  //       separatorBuilder: (context, index) => const SizedBox(
  //         height: 5,
  //       ),
  //       itemBuilder: (context, index) {
  //         int serial = 0;
  //         itemList = provider
  //             .merchantDataList[index].assignBranchPickupList!
  //             .cast<AssignBranchPickupList>();
  //         return Card(
  //           elevation: 3,
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10)),
  //           child: ExpansionTile(
  //             iconColor: logoblue,
  //             collapsedIconColor: logogold,
  //             onExpansionChanged: (value) {
  //               setState(() {
  //                 isExpanded =
  //                 isExpanded == false ? true : false;
  //                 print(isExpanded);
  //               });
  //             },
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10)),
  //             // tilePadding:
  //             //     EdgeInsets.symmetric(horizontal: 10.w),
  //             //     leading: Container(
  //             //       height: 20,
  //             //       width: 20,
  //             //       child: Checkbox(onChanged: (value) {
  //
  //             //       }, value: false,),
  //             //     ),
  //             title: Text(
  //               provider.marchantList[index].userName! ??
  //                   'N/A',
  //               style: const TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   letterSpacing: 1,
  //                   fontSize: 14,
  //                   color: Colors.black),
  //             ),
  //             subtitle: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Phone: ${provider.marchantList[index].userPhone!}',
  //                   style: const TextStyle(
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //                 Text(
  //                   'Address: ${provider.marchantList[index].address!}',
  //                   style: const TextStyle(
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //                 Text(
  //                   'Item Count : ${itemList!.length.toString()}',
  //                   style: const TextStyle(
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //               ],
  //             ),
  //             children: itemList!.map((item) {
  //               serial++;
  //               return Column(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 children: [
  //                   serial == 1
  //                       ? Container(
  //                     height: 50,
  //                     child: Row(
  //                       mainAxisAlignment:
  //                       MainAxisAlignment.end,
  //                       children: [
  //                         Text('Select All'),
  //                         Checkbox(
  //                           onChanged: (value) {},
  //                           value: false,
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                       : Container(),
  //                   Padding(
  //                     padding:
  //                     const EdgeInsets.only(left: 15.0),
  //                     child: ListTile(
  //                       style: ListTileStyle.list,
  //                       contentPadding:
  //                       const EdgeInsets.symmetric(
  //                           horizontal: 16),
  //                       // leading: Checkbox(onChanged: (bool? value) {  }, value: false,),
  //                       trailing: Container(
  //                         height: 20,
  //                         width: 20,
  //                         child: Checkbox(
  //                           onChanged: (value) {},
  //                           value: false,
  //                         ),
  //                       ),
  //                       title: SizedBox(
  //                         child: Row(
  //                           crossAxisAlignment:
  //                           CrossAxisAlignment.start,
  //                           children: [
  //                             Text(
  //                               "${serial}.  ",
  //                               style: const TextStyle(
  //                                   fontWeight:
  //                                   FontWeight.bold),
  //                             ),
  //                             Expanded(
  //                                 child: Container(
  //                                   decoration: BoxDecoration(
  //                                       color: logogold
  //                                           .withOpacity(0.4),
  //                                       border: Border.all(),
  //                                       borderRadius:
  //                                       BorderRadius.circular(
  //                                           12)),
  //                                   child: Padding(
  //                                     padding:
  //                                     const EdgeInsets.all(
  //                                         2.0),
  //                                     child: Column(
  //                                       children: [
  //                                         Column(
  //                                           mainAxisAlignment:
  //                                           MainAxisAlignment
  //                                               .spaceBetween,
  //                                           children: [
  //                                             Container(
  //                                               child: Row(
  //                                                 children: [
  //                                                   const Icon(
  //                                                     Icons
  //                                                         .emoji_people,
  //                                                     color:
  //                                                     logoblue,
  //                                                   ),
  //                                                   const Text(
  //                                                     "Customer Name: ",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                         logoblue,
  //                                                         fontWeight:
  //                                                         FontWeight.w500),
  //                                                   ),
  //                                                   Text(
  //                                                       "${item.recipientName21}",
  //                                                       style: const TextStyle(
  //                                                           color:
  //                                                           logoblue,
  //                                                           fontWeight:
  //                                                           FontWeight.w500))
  //                                                 ],
  //                                               ),
  //                                             ),
  //                                             Container(
  //                                               child: Row(
  //                                                 children: [
  //                                                   const Icon(
  //                                                       Icons
  //                                                           .phone,
  //                                                       color:
  //                                                       logoblue),
  //                                                   const Text(
  //                                                       "Customer Phone: ",
  //                                                       style: TextStyle(
  //                                                           color:
  //                                                           logoblue,
  //                                                           fontWeight:
  //                                                           FontWeight.w500)),
  //                                                   Text(
  //                                                       "${item.recipientPhone20}",
  //                                                       style: const TextStyle(
  //                                                           color:
  //                                                           logoblue,
  //                                                           fontWeight:
  //                                                           FontWeight.w500))
  //                                                 ],
  //                                               ),
  //                                             ),
  //                                             Row(
  //                                               children: [
  //                                                 const Icon(
  //                                                     Icons
  //                                                         .numbers,
  //                                                     color:
  //                                                     logoblue),
  //                                                 const Text(
  //                                                     "Invoice: ",
  //                                                     style: TextStyle(
  //                                                         color:
  //                                                         logoblue,
  //                                                         fontWeight:
  //                                                         FontWeight.w500)),
  //                                                 Text(
  //                                                     "${item.merchantInvoice}",
  //                                                     style: const TextStyle(
  //                                                         color:
  //                                                         logoblue,
  //                                                         fontWeight:
  //                                                         FontWeight.w500))
  //                                               ],
  //                                             )
  //                                           ],
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 )),
  //                           ],
  //                         ),
  //                       ),
  //                       dense: true,
  //                       onTap: () {
  //                         Navigator.pushNamed(context,
  //                             ItemDetailsPage.routeName);
  //                       },
  //                     ),
  //                   ),
  //                   serial == itemList!.length
  //                       ? Row(
  //                     mainAxisAlignment:
  //                     MainAxisAlignment.center,
  //                     children: [
  //                       ElevatedButton(
  //                           onPressed: () {},
  //                           child:
  //                           Text('Collect Pickup')),
  //                     ],
  //                   )
  //                       : Container()
  //                 ],
  //               );
  //             }).toList(),
  //           ),
  //         );
  //
  //         // Text('${deptData[index]['name']}');
  //       },
  //     ),
  //   );
  // }
}
