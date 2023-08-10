import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/providers/delivery_provider.dart';
import 'package:flybee/utils/colors.dart';
import 'package:provider/provider.dart';

import '../models/merchant_pickup_model.dart';

class DeliveryPage extends StatefulWidget {
  static const String routeName = '/delivery';

  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

enum RadioOption { delivered, returned }

class _DeliveryPageState extends State<DeliveryPage>
    with TickerProviderStateMixin {
  late DeliveryProvider deliveryProvider;
  late TabController _tabController;
  bool isExpanded = false;
  RadioOption _site = RadioOption.delivered;
  Future<void> refreshData() async {
    setState(() {
      deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);
      deliveryProvider.getDeliveryList();
    });
  }

  @override
  void initState() {
    deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);
    deliveryProvider.getDeliveryList();
    // deliveryProvider.getDeliveryStatusList();
    super.initState();
  }

  TextEditingController remarkController = TextEditingController();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool formOpenFlag = false;

  @override
  Widget build(BuildContext context) {
    List<AssignBranchPickupList>? itemList = [];
    _tabController = TabController(length: 2, vsync: this);
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
              Tab(text: 'Delivery Assign'),
              Tab(text: 'Status'),
            ],
          ),
          Consumer<DeliveryProvider>(
            builder: (context, provider, child) {
              return Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    provider.deliveryList.isEmpty
                        ? const Center(
                            child: Text(
                            "Delivery list is empty",
                            style: TextStyle(color: Colors.black),
                          ))
                        : RefreshIndicator(
                            onRefresh: refreshData,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: provider.deliveryList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: _buildDeliveryItem(index, provider),
                                );
                              },
                            ),
                          ),
                    // Consumer<MarchantProvider>(
                    //   builder: (context, provider, child) {
                    //     return Container(
                    //       padding: EdgeInsets.symmetric(horizontal: 8.w),
                    //       child: ListView.builder(
                    //         shrinkWrap: true,
                    //         physics: const BouncingScrollPhysics(
                    //             parent: AlwaysScrollableScrollPhysics()),
                    //         itemCount: provider.marchantList.length,
                    //         itemBuilder: (context, index) {
                    //           int serial = 0;
                    //           itemList = provider.merchantDataList[index]
                    //               .assignBranchPickupList!;
                    //           return Card(
                    //             elevation: 3,
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             child: ExpansionTile(
                    //               iconColor: logoblue,
                    //               collapsedIconColor: logogold,
                    //               onExpansionChanged: (va) {
                    //                 setState(() {
                    //                   isExpanded =
                    //                       isExpanded == true ? false : true;
                    //                   print(isExpanded);
                    //                 });
                    //               },
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(10)),
                    //               // tilePadding:
                    //               //     EdgeInsets.symmetric(horizontal: 10.w),
                    //               //     leading: Container(
                    //               //       height: 20,
                    //               //       width: 20,
                    //               //       child: Checkbox(onChanged: (value) {

                    //               //       }, value: false,),
                    //               //     ),
                    //               title: Text(
                    //                 provider.marchantList[index].userName! ??
                    //                     'N/A',
                    //                 style: const TextStyle(
                    //                     fontWeight: FontWeight.bold,
                    //                     letterSpacing: 1,
                    //                     fontSize: 14,
                    //                     color: Colors.black),
                    //               ),
                    //               subtitle: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     'Phone: ${provider.marchantList[index].userPhone!}',
                    //                     style: const TextStyle(
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                   Text(
                    //                     'Address: ${provider.marchantList[index].address!}',
                    //                     style: const TextStyle(
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                   Text(
                    //                     'Item Count : ${itemList!.length.toString()}',
                    //                     style: const TextStyle(
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                 ],
                    //               ),
                    //               children: itemList!.map((item) {
                    //                 serial++;
                    //                 return Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.end,
                    //                   children: [
                    //                     serial == 1
                    //                         ? Container(
                    //                             height: 50,
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.end,
                    //                               children: [
                    //                                 Text('Select All'),
                    //                                 Checkbox(
                    //                                   onChanged: (value) {},
                    //                                   value: false,
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           )
                    //                         : Container(),
                    //                     Padding(
                    //                       padding:
                    //                           const EdgeInsets.only(left: 15.0),
                    //                       child: ListTile(
                    //                         style: ListTileStyle.list,
                    //                         contentPadding:
                    //                             const EdgeInsets.symmetric(
                    //                                 horizontal: 16),
                    //                         // leading: Checkbox(onChanged: (bool? value) {  }, value: false,),
                    //                         trailing: Container(
                    //                           height: 20,
                    //                           width: 20,
                    //                           child: Checkbox(
                    //                             onChanged: (value) {},
                    //                             value: false,
                    //                           ),
                    //                         ),
                    //                         title: SizedBox(
                    //                           child: Row(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(
                    //                                 "${serial}.  ",
                    //                                 style: const TextStyle(
                    //                                     fontWeight:
                    //                                         FontWeight.bold),
                    //                               ),
                    //                               Expanded(
                    //                                   child: Container(
                    //                                 decoration: BoxDecoration(
                    //                                     color: logogold
                    //                                         .withOpacity(0.4),
                    //                                     border: Border.all(),
                    //                                     borderRadius:
                    //                                         BorderRadius
                    //                                             .circular(12)),
                    //                                 child: Padding(
                    //                                   padding:
                    //                                       const EdgeInsets.all(
                    //                                           2.0),
                    //                                   child: Column(
                    //                                     children: [
                    //                                       Column(
                    //                                         mainAxisAlignment:
                    //                                             MainAxisAlignment
                    //                                                 .spaceBetween,
                    //                                         children: [
                    //                                           Container(
                    //                                             child: Row(
                    //                                               children: [
                    //                                                 const Icon(
                    //                                                   Icons
                    //                                                       .emoji_people,
                    //                                                   color:
                    //                                                       logoblue,
                    //                                                 ),
                    //                                                 const Text(
                    //                                                   "Customer Name: ",
                    //                                                   style: TextStyle(
                    //                                                       color:
                    //                                                           logoblue,
                    //                                                       fontWeight:
                    //                                                           FontWeight.w500),
                    //                                                 ),
                    //                                                 Text(
                    //                                                     "${item.recipientName21}",
                    //                                                     style: const TextStyle(
                    //                                                         color:
                    //                                                             logoblue,
                    //                                                         fontWeight:
                    //                                                             FontWeight.w500))
                    //                                               ],
                    //                                             ),
                    //                                           ),
                    //                                           Container(
                    //                                             child: Row(
                    //                                               children: [
                    //                                                 const Icon(
                    //                                                     Icons
                    //                                                         .phone,
                    //                                                     color:
                    //                                                         logoblue),
                    //                                                 const Text(
                    //                                                     "Customer Phone: ",
                    //                                                     style: TextStyle(
                    //                                                         color:
                    //                                                             logoblue,
                    //                                                         fontWeight:
                    //                                                             FontWeight.w500)),
                    //                                                 Text(
                    //                                                     "${item.recipientPhone20}",
                    //                                                     style: const TextStyle(
                    //                                                         color:
                    //                                                             logoblue,
                    //                                                         fontWeight:
                    //                                                             FontWeight.w500))
                    //                                               ],
                    //                                             ),
                    //                                           ),
                    //                                           Row(
                    //                                             children: [
                    //                                               const Icon(
                    //                                                   Icons
                    //                                                       .numbers,
                    //                                                   color:
                    //                                                       logoblue),
                    //                                               const Text(
                    //                                                   "Invoice: ",
                    //                                                   style: TextStyle(
                    //                                                       color:
                    //                                                           logoblue,
                    //                                                       fontWeight:
                    //                                                           FontWeight.w500)),
                    //                                               Text(
                    //                                                   "${item.merchantInvoice}",
                    //                                                   style: const TextStyle(
                    //                                                       color:
                    //                                                           logoblue,
                    //                                                       fontWeight:
                    //                                                           FontWeight.w500))
                    //                                             ],
                    //                                           )
                    //                                         ],
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               )),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                         dense: true,
                    //                         onTap: () {
                    //                           Navigator.pushNamed(context,
                    //                               ItemDetailsPage.routeName);
                    //                         },
                    //                       ),
                    //                     ),
                    //                     serial == itemList!.length
                    //                         ? Row(
                    //                             mainAxisAlignment:
                    //                                 MainAxisAlignment.center,
                    //                             children: [
                    //                               ElevatedButton(
                    //                                   onPressed: () {},
                    //                                   child: Text(
                    //                                       'Collect Pickup')),
                    //                             ],
                    //                           )
                    //                         : Container()
                    //                   ],
                    //                 );
                    //               }).toList(),
                    //             ),
                    //           );

                    //           // Text('${deptData[index]['name']}');
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),

                    ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: provider.statusDeliveryList == null
                          ? 0
                          : provider.statusDeliveryList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: _buildActiveDeliveryItem(index, provider),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActiveDeliveryItem(int index, DeliveryProvider provider) {
    // log(provider.statusDeliveryList!.length.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: ListTile(
            style: ListTileStyle.list,
            // contentPadding: EdgeInsets.symmetric(horizontal: 0.sp),
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.hail),
            title: Row(
              children: [
                Text(
                  "Delivery Status",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                    'Invoice :' +
                        (provider.statusDeliveryList![index].id.toString()),
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp))
              ],
            ),
            dense: true,
            onTap: () {
              // Navigator.pushNamed(
              //     context, ItemDetailsPage.routeName);
            },
          ),
          // subtitle: Text(provider.statusDeliveryList![index].senderAddress9!),
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
            //           child: Container(
            //         decoration: BoxDecoration(
            //             color: logogold.withOpacity(0.4),
            //             border: Border.all(),
            //             borderRadius: BorderRadius.circular(12)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(2.0),
            //           child: Column(
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Container(
            //                     child: Row(
            //                       children: [
            //                         const Icon(
            //                           Icons.price_change,
            //                           color: logoblue,
            //                         ),
            //                         const Text(
            //                           "Fixed Price: ",
            //                           style: TextStyle(
            //                               color: logoblue,
            //                               fontWeight: FontWeight.w500),
            //                         ),
            //                         Text(
            //                             "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['fixed_cost']}",
            //                             style: const TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500))
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                     child: Row(
            //                       children: [
            //                         const Icon(Icons.price_change,
            //                             color: logoblue),
            //                         const Text("Selling Price: ",
            //                             style: TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500)),
            //                         Text(
            //                             "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['selling_price']}",
            //                             style: const TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500))
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Container(
            //                     child: Row(
            //                       children: [
            //                         const Icon(Icons.monitor_weight_outlined,
            //                             color: logoblue),
            //                         const Text("Weight: ",
            //                             style: TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500)),
            //                         Text(
            //                             "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['weight']}",
            //                             style: const TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500))
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                     child: Row(
            //                       children: [
            //                         const Icon(Icons.shopping_bag_outlined,
            //                             color: logoblue),
            //                         const Text("Quantity: ",
            //                             style: TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500)),
            //                         Text(
            //                             "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['qty']}",
            //                             style: const TextStyle(
            //                                 color: logoblue,
            //                                 fontWeight: FontWeight.w500))
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       )),
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
                          const Text('Delivery Status'),
                          Row(
                            children: [
                              Icon(
                                Icons.done,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(provider
                                      .statusDeliveryList![index]
                                      .iDeliveryStatus!
                                      .iDeliveryStatus
                                      .toString()))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Merchant Number'),
                          Row(
                            children: [
                              Icon(
                                Icons.numbers,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: provider.statusDeliveryList![index]
                                              .merchantInvoice !=
                                          null
                                      ? Text('Merchant Number: ' +
                                          provider.statusDeliveryList![index]
                                              .merchantInvoice!
                                              .toString())
                                      : Text('N/A'))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
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
                                      .statusDeliveryList![index].senderName6!))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Marchant Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.home,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(provider
                                      .statusDeliveryList![index]
                                      .senderAddress9!))
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
                                      .statusDeliveryList![index]
                                      .senderPhone5!))
                            ],
                          ),
                          const Text('Marchant Branch'),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(provider
                                      .statusDeliveryList![index]
                                      .currentBranch!
                                      .branch
                                      .toString()))
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
                                      .statusDeliveryList![index]
                                      .recipientName21!))
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
                                  child: Text(provider
                                      .statusDeliveryList![index]
                                      .recipientAddress24!))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Customer Number'),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(provider
                                      .statusDeliveryList![index]
                                      .recipientPhone20!))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryItem(int index, DeliveryProvider provider) {
    String selectedValue = '';

    print(provider.deliveryList[index].productInfo4!.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          key: GlobalKey(),
          initiallyExpanded: formOpenFlag,
          title: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       child: Row(
              //         children: [
              //           const Icon(Icons.price_change),
              //           const Text("Fixed Price: "),
              //           Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['fixed_cost']}")
              //         ],
              //       ),
              //     ),
              //
              // Container(
              //       child: Row(
              //         children: [
              //           const Icon(Icons.price_change),
              //           const Text("Selling Price: "),
              //           Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['selling_price']}")
              //         ],
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       child: Row(
              //         children: [
              //           const Icon(Icons.monitor_weight_outlined),
              //           const Text("Weight: "),
              //           Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['weight']}")
              //         ],
              //       ),
              //     ),
              //     Container(
              //       child: Row(
              //         children: [
              //           const Icon(Icons.shopping_bag_outlined),
              //           const Text("Quantity: "),
              //           Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['qty']}")
              //         ],
              //       ),
              //     )
              //   ],
              // )
              Row(
                children: [
                  Icon(Icons.numbers),
                  Text(
                      'Invoice: ' + provider.deliveryList[index].id.toString()),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.people),
                  Text(
                      ' Customer Name : ${provider.deliveryList[index].recipientName21!}'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  Text(
                      'Customer Phone : ${provider.deliveryList[index].recipientPhone20!}'),
                ],
              ),
            ],
          ),
          subtitle: Row(
            children: [
              const Icon(Icons.location_on_outlined),
              Expanded(
                  child: Text(
                      'Customer Address : ${provider.deliveryList[index].recipientAddress24!}')),
            ],
          ),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   decoration: const BoxDecoration(
                  //       border: Border(
                  //     bottom: BorderSide(
                  //       color: Colors.black,
                  //       width: 0.5,
                  //     ),
                  //   )),
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text('Branch Address'),
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.location_pin,
                  //               size: 22.sp,
                  //             ),
                  //             Expanded(
                  //                 child: Text(
                  //                 provider.deliveryList[index].senderAddress9!,
                  //               style: TextStyle(fontSize: 18.sp),
                  //             ))
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           height: 10.h,
                  //         ),
                  //         const Text('User Address'),
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.location_pin,
                  //               size: 22.sp,
                  //             ),
                  //             Expanded(
                  //                 child: Text(
                  //               (provider.deliveryList[index].recipientAddress24!),
                  //               style: TextStyle(fontSize: 18.sp),
                  //             ))
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
                  //           const Text('Collection Time'),
                  //           Row(
                  //             children: [
                  //               Icon(
                  //                 Icons.access_time,
                  //                 size: 22.sp,
                  //               ),
                  //               SizedBox(
                  //                 width: 8.w,
                  //               ),
                  //               Text(provider.deliveryList[index].deliveryBoyDate!.toString().substring(0, 10),
                  //                   style: TextStyle(
                  //                       fontSize: 18.sp, color: Colors.black))
                  //             ],
                  //           )
                  //         ],
                  //       )),
                  //       Expanded(
                  //           child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text('Delivery Time'),
                  //           SizedBox(
                  //             width: 8.w,
                  //           ),
                  //           Row(
                  //             children: [
                  //               Icon(
                  //                 Icons.access_time,
                  //                 size: 22.sp,
                  //               ),
                  //               Text(provider.deliveryList[index].deliveryDate!.toString().substring(0, 10),
                  //                   style: TextStyle(
                  //                       fontSize: 18.sp, color: Colors.black))
                  //             ],
                  //           )
                  //         ],
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     // SizedBox(
                  //     //   height: 30.h,
                  //     //   // width: 115.w,
                  //     //   child: ElevatedButton(
                  //     //     style: ElevatedButton.styleFrom(
                  //     //       backgroundColor: const Color(0xFF01B075),
                  //     //       shape: RoundedRectangleBorder(
                  //     //         borderRadius:
                  //     //             BorderRadius.circular(8), // <-- Radius
                  //     //       ),
                  //     //     ),
                  //     //     onPressed: () {
                  //     //       setState(() {});
                  //     //     },
                  //     //     child: Text(
                  //     //       'Partial Delivery',
                  //     //       style: TextStyle(fontSize: 14.sp),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     SizedBox(
                  //       height: 30.h,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: logoblue,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius:
                  //                 BorderRadius.circular(8), // <-- Radius
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           setState(() {});
                  //         },
                  //         child: Text(
                  //           'Full Delivery',
                  //           style: TextStyle(fontSize: 14.sp),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: 30.h,
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.red,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius:
                  //                 BorderRadius.circular(8), // <-- Radius
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           setState(() {});
                  //         },
                  //         child: Text(
                  //           'Return',
                  //           style: TextStyle(fontSize: 14.sp),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.person_search),
                          // provider.deliveryList[index].merchantInvoice
                          Text(provider.deliveryList[index].merchantInvoice !=
                                  null
                              ? 'Merchant Number: ' +
                                  provider.deliveryList[index].merchantInvoice!
                              : 'Merchant Number: N/A'),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          provider.deliveryList[index].senderPhone5 != null
                              ? Text('Merchant Phone: ' +
                                  provider.deliveryList[index].senderPhone5!)
                              : Text('Merchant Phone: N/A')
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage('images/taka.icon.png'),
                            size: 30.sp,
                          ),
                          Text(provider.deliveryList[index].collectionAmount !=
                                  null
                              ? 'Amount :' +
                                  provider.deliveryList[index].collectionAmount!
                                      .toString()
                              : 'Collection Amount : N/A'),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: RadioOption.delivered,
                                groupValue: _site,
                                onChanged: (RadioOption? value) {
                                  setState(() {
                                    _site = value!;
                                    formOpenFlag = true;
                                    log(_site.toString());
                                  });
                                },
                              ),
                              Text('Delivered'),
                            ],
                          ),
                          if (_site == RadioOption.delivered)
                            ElevatedButton(
                                onPressed: () async {
                                  await provider.saveDelivery(
                                    pickupId: provider.deliveryList[index].id
                                        .toString(),
                                    statusId: '6',
                                    context: context,
                                  );
                                  setState(() {
                                    formOpenFlag = false;
                                  });
                                },
                                child: Text('Confirm')),
                          Row(
                            children: [
                              Radio(
                                value: RadioOption.returned,
                                groupValue: _site,
                                onChanged: (RadioOption? value) {
                                  setState(() {
                                    _site = value!;
                                    log(_site.toString());
                                    formOpenFlag = true;
                                  });
                                },
                              ),
                              Text('Return'),
                            ],
                          ),
                          if (_site == RadioOption.returned)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: remarkController,
                                    decoration: InputDecoration(
                                      labelText: 'Arrived',
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        await provider.saveDelivery(
                                          pickupId: provider
                                              .deliveryList[index].id
                                              .toString(),
                                          statusId: '7',
                                          context: context,
                                          remark:
                                              remarkController.text.toString(),
                                        );
                                        setState(() {
                                          formOpenFlag = false;
                                        });
                                      },
                                      child: Text('Confirm'))
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
