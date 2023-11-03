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

  List<bool> expandbools = [];

  @override
  void initState() {
    deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);

    // deliveryProvider.getDeliveryStatusList();
    getData();
    super.initState();
  }

  getData() async {

    await deliveryProvider.getDeliveryList();
    expandbools = generateBoolList(deliveryProvider.deliveryList.length);
    // }
  }

  List<bool> generateBoolList(int length) {
    return List<bool>.filled(length, false);
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
                    provider.statusDeliveryList==null || provider.statusDeliveryList!.isEmpty? const Center(
                        child: Text(
                          "Delivery status list is empty",
                          style: TextStyle(color: Colors.black),
                        )):ListView.builder(
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
                        (provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?'':provider.statusDeliveryList![index]!.id.toString()),
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
                                  child: Text(provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?'':provider
                                      .statusDeliveryList![index]
                                      .iDeliveryStatus!
                                      .iDeliveryStatus
                                      .toString()))
                            ],
                          ),
                          const Text('Note'),
                          Row(
                            children: [
                              Icon(
                                Icons.speaker_notes_rounded,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?'':
                                  provider
                                      .statusDeliveryList![index].pickup_return_status==null?"N/A":
                                  provider.statusDeliveryList![index].pickup_return_status!))
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : provider.statusDeliveryList![index]
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
                                  child:provider.statusDeliveryList==null ||provider.statusDeliveryList!.isEmpty?
                                  Text('N/A')
                                      : Text(provider
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: InkWell(
          onTap: () {
            expandbools[index] = expandbools[index] == true ? false : true;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(microseconds: 2),
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.numbers),
                          Text(' Invoice: ' +
                              provider.deliveryList[index].id.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.people),
                          // Text(
                          //     ' Cus Name : ${provider.deliveryList[index].recipientName21!}'),
                          Expanded(
                            child: Text(
                              ' Cus Name : ${provider.deliveryList[index].recipientName21!}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Expanded(
                            child: Text(
                              ' Cus Phone : ${provider.deliveryList[index].recipientPhone20!}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Expanded(
                          child: Text(
                              ' Cus Address : ${provider.deliveryList[index].recipientAddress24!}')),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ),
                expandbools[index] == true
                    ? Container(
                        // height: 20,
                        // color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                      Text(provider.deliveryList[index]
                                                  .merchantInvoice !=
                                              null
                                          ? 'Merchant Number: ' +
                                              provider.deliveryList[index]
                                                  .merchantInvoice!
                                          : 'Merchant Number: N/A'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      provider.deliveryList[index]
                                                  .senderPhone5 !=
                                              null
                                          ? Text('Merchant Phone: ' +
                                              provider.deliveryList[index]
                                                  .senderPhone5!)
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
                                      Text(provider.deliveryList[index]
                                                  .collectionAmount !=
                                              null
                                          ? 'Amount :' +
                                              provider.deliveryList[index]
                                                  .collectionAmount!
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
                                              expandbools[index] = false;
                                              await provider.saveDelivery(
                                                pickupId: provider
                                                    .deliveryList[index].id
                                                    .toString(),
                                                statusId: '6',
                                                context: context,
                                              );
                                              setState(() {
                                                formOpenFlag = false;
                                                expandbools[index] = false;
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
                                                    expandbools[index] = false;
                                                    await provider.saveDelivery(
                                                      pickupId: provider
                                                          .deliveryList[index]
                                                          .id
                                                          .toString(),
                                                      statusId: '7',
                                                      context: context,
                                                      remark: remarkController
                                                          .text
                                                          .toString(),
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
                      )
                    : Container()
              ],
            ),
          ),
        ),

        // ExpansionTile(
        //   iconColor: logoblue,
        //   collapsedIconColor: logogold,
        //   key: GlobalKey(),
        //   initiallyExpanded: formOpenFlag,
        //   title: Column(
        //     children: [
        //       Row(
        //         children: [
        //           Icon(Icons.numbers),
        //           Text(
        //               'Invoice: ' + provider.deliveryList[index].id.toString()),
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Icon(Icons.people),
        //           Text(
        //               ' Customer Name : ${provider.deliveryList[index].recipientName21!}'),
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Icon(Icons.phone),
        //           Text(
        //               'Customer Phone : ${provider.deliveryList[index].recipientPhone20!}'),
        //         ],
        //       ),
        //     ],
        //   ),
        //   subtitle: Row(
        //     children: [
        //       const Icon(Icons.location_on_outlined),
        //       Expanded(
        //           child: Text(
        //               'Customer Address : ${provider.deliveryList[index].recipientAddress24!}')),
        //     ],
        //   ),
        //   children: [
        //     Padding(
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               SizedBox(
        //                 height: 5.h,
        //               ),
        //               Row(
        //                 children: [
        //                   Icon(Icons.person_search),
        //                   // provider.deliveryList[index].merchantInvoice
        //                   Text(provider.deliveryList[index].merchantInvoice !=
        //                           null
        //                       ? 'Merchant Number: ' +
        //                           provider.deliveryList[index].merchantInvoice!
        //                       : 'Merchant Number: N/A'),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 5.h,
        //               ),
        //               Row(
        //                 children: [
        //                   Icon(Icons.phone),
        //                   provider.deliveryList[index].senderPhone5 != null
        //                       ? Text('Merchant Phone: ' +
        //                           provider.deliveryList[index].senderPhone5!)
        //                       : Text('Merchant Phone: N/A')
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 5.h,
        //               ),
        //               Row(
        //                 children: [
        //                   ImageIcon(
        //                     AssetImage('images/taka.icon.png'),
        //                     size: 30.sp,
        //                   ),
        //                   Text(provider.deliveryList[index].collectionAmount !=
        //                           null
        //                       ? 'Amount :' +
        //                           provider.deliveryList[index].collectionAmount!
        //                               .toString()
        //                       : 'Collection Amount : N/A'),
        //                 ],
        //               ),
        //               Column(
        //                 children: [
        //                   Row(
        //                     children: [
        //                       Radio(
        //                         value: RadioOption.delivered,
        //                         groupValue: _site,
        //                         onChanged: (RadioOption? value) {
        //                           setState(() {
        //                             _site = value!;
        //                             formOpenFlag = true;
        //                             log(_site.toString());
        //                           });
        //                         },
        //                       ),
        //                       Text('Delivered'),
        //                     ],
        //                   ),
        //                   if (_site == RadioOption.delivered)
        //                     ElevatedButton(
        //                         onPressed: () async {
        //                           await provider.saveDelivery(
        //                             pickupId: provider.deliveryList[index].id
        //                                 .toString(),
        //                             statusId: '6',
        //                             context: context,
        //                           );
        //                           setState(() {
        //                             formOpenFlag = false;
        //                           });
        //                         },
        //                         child: Text('Confirm')),
        //                   Row(
        //                     children: [
        //                       Radio(
        //                         value: RadioOption.returned,
        //                         groupValue: _site,
        //                         onChanged: (RadioOption? value) {
        //                           setState(() {
        //                             _site = value!;
        //                             log(_site.toString());
        //                             formOpenFlag = true;
        //                           });
        //                         },
        //                       ),
        //                       Text('Return'),
        //                     ],
        //                   ),
        //                   if (_site == RadioOption.returned)
        //                     Padding(
        //                       padding: const EdgeInsets.all(8.0),
        //                       child: Column(
        //                         children: [
        //                           TextFormField(
        //                             controller: remarkController,
        //                             decoration: InputDecoration(
        //                               labelText: 'Arrived',
        //                             ),
        //                           ),
        //                           ElevatedButton(
        //                               onPressed: () async {
        //                                 await provider.saveDelivery(
        //                                   pickupId: provider
        //                                       .deliveryList[index].id
        //                                       .toString(),
        //                                   statusId: '7',
        //                                   context: context,
        //                                   remark:
        //                                       remarkController.text.toString(),
        //                                 );
        //                                 setState(() {
        //                                   formOpenFlag = false;
        //                                 });
        //                               },
        //                               child: Text('Confirm'))
        //                         ],
        //                       ),
        //                     ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),

        //   ],
        // ),
      ),
    );
  }
}
