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
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          child: _buildActiveDeliveryItem(index),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActiveDeliveryItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: Text(
            'Product ${index + 1}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          subtitle: const Text('Mirpur, Dhaka'),
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
                                'Dhaka',
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
                                Text('8am',
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
                                Text('10am',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.black))
                              ],
                            )
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          iconColor: logoblue,
          collapsedIconColor: logogold,
          title: Text(
            provider.deliveryList[index].productInfo4!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          subtitle: Text(provider.deliveryList[index].recipientAddress24!),
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
                      SizedBox(
                        height: 30.h,
                        // width: 115.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF01B075),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            'Partial Delivery',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: logogold,
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
