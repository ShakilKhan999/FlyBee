
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/providers/delivery_provider.dart';
import 'package:flybee/utils/colors.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget {
  static const String routeName = '/delivery';
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage>
    with TickerProviderStateMixin {
  late DeliveryProvider deliveryProvider;
  late TabController _tabController;

  @override
  void initState() {
    deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);
    deliveryProvider.getDeliveryList();
    // deliveryProvider.getDeliveryStatusList();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Tab(text: 'Delivery List'),
              Tab(text: 'Status'),
            ],
          ),
          Consumer<DeliveryProvider>(
            builder: (context, provider, child) {
              return Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    provider.deliveryList.isEmpty?const Center(child: Text("Delivery list is empty",style: TextStyle(color: Colors.black),)):
                    ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: provider.deliveryList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: _buildDeliveryItem(index, provider),
                        );
                      },
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                      itemCount: provider.statusDeliveryList == null ? 0: provider.statusDeliveryList!.length,
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

  Widget _buildActiveDeliveryItem(int index,DeliveryProvider provider) {
    // log(provider.statusDeliveryList!.length.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: ListTile(
            style: ListTileStyle.list,
            contentPadding:
            const EdgeInsets.symmetric(
                horizontal: 16),
            leading: Icon(Icons.hail),
            title: Text("Delivery Completed",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.sp),),
            dense: true,
            onTap: () {
              // Navigator.pushNamed(
              //     context, ItemDetailsPage.routeName);
            },
          ),
          subtitle: Text(provider.statusDeliveryList![index].senderAddress9!),
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}.  ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                            logogold.withOpacity(0.4),
                            border: Border.all(),
                            borderRadius:
                            BorderRadius.circular(
                                12)),
                        child: Padding(
                          padding:
                          const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons
                                              .price_change,
                                          color: logoblue,
                                        ),
                                        const Text(
                                          "Fixed Price: ",
                                          style: TextStyle(
                                              color:
                                              logoblue,
                                              fontWeight:
                                              FontWeight
                                                  .w500),
                                        ),
                                        Text(
                                            "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['fixed_cost']}",
                                            style: const TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Icon(
                                            Icons
                                                .price_change,
                                            color:
                                            logoblue),
                                        const Text(
                                            "Selling Price: ",
                                            style: TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500)),
                                        Text(
                                            "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['selling_price']}",
                                            style: const TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                            Icons
                                                .monitor_weight_outlined,
                                            color:
                                            logoblue),
                                        Text("Weight: ",
                                            style: TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500)),
                                        Text(
                                            "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['weight']}",
                                            style: TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                            Icons
                                                .shopping_bag_outlined,
                                            color:
                                            logoblue),
                                        Text("Quantity: ",
                                            style: TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500)),
                                        Text(
                                            "${provider.productInfoMapMaker(provider.statusDeliveryList![index].productInfo4.toString())[0]['qty']}",
                                            style: TextStyle(
                                                color:
                                                logoblue,
                                                fontWeight:
                                                FontWeight
                                                    .w500))
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
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
                          const Text('Marchant Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(
                                'Dhaka',
                                style: TextStyle(fontSize: 18.sp),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('Branch Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(
                                ('Chittagong'),
                                style: TextStyle(fontSize: 18.sp),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    )),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Order Pickup Time'),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 22.sp,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text('8am',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.black))
                              ],
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
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
    print(provider.deliveryList[index].productInfo4!.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.price_change),
                        Text("Fixed Price: "),
                        Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['fixed_cost']}")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.price_change),
                        Text("Selling Price: "),
                        Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['selling_price']}")
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.monitor_weight_outlined),
                        Text("Weight: "),
                        Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['weight']}")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        Text("Quantity: "),
                        Text("${deliveryProvider.productInfoMapMaker(provider.deliveryList[index].productInfo4!.toString())[0]['qty']}")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          subtitle: Row(
            children: [
              Icon(Icons.location_on_outlined),
              Expanded(child: Text(provider.deliveryList[index].recipientAddress24!)),
            ],
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
                          const Text('Branch Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(
                                  provider.deliveryList[index].senderAddress9!,
                                style: TextStyle(fontSize: 18.sp),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text('User Address'),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 22.sp,
                              ),
                              Expanded(
                                  child: Text(
                                (provider.deliveryList[index].recipientAddress24!),
                                style: TextStyle(fontSize: 18.sp),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.5,
                      ),
                    )),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Collection Time'),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 22.sp,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(provider.deliveryList[index].deliveryBoyDate!.toString().substring(0, 10),
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.black))
                              ],
                            )
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Delivery Time'),
                            SizedBox(
                              width: 8.w,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 22.sp,
                                ),
                                Text(provider.deliveryList[index].deliveryDate!.toString().substring(0, 10),
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.black))
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: 30.h,
                      //   // width: 115.w,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: const Color(0xFF01B075),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.circular(8), // <-- Radius
                      //       ),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {});
                      //     },
                      //     child: Text(
                      //       'Partial Delivery',
                      //       style: TextStyle(fontSize: 14.sp),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: logoblue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            'Full Delivery',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            'Return',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
