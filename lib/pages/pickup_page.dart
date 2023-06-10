import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/utils/colors.dart';

import 'item_details.dart';

class PickUpPage extends StatefulWidget {
  static const String routeName = '/pickup';

  const PickUpPage({Key? key}) : super(key: key);

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List data = [
    {
      'name': 'shamim',
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
      'name': 'shakil',
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
      'name': 'syed',
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
      'name': 'habib',
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
    _tabController = TabController(length: 2, vsync: this);
    var itemList = [];
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
              Tab(text: 'Active Pickup List'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemBuilder: (context, index) {
                      itemList = data[index]['items'];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ExpansionTile(
                          iconColor: logoblue,
                          collapsedIconColor: logogold,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tilePadding: EdgeInsets.symmetric(horizontal: 10.w),
                          title: Text(
                            data[index]['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          subtitle: const Text('Marchant Address'),
                          children: itemList.map((item) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: ListTile(
                                style: ListTileStyle.list,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                // leading: Icon(Icons.ac_unit_sharp),
                                title: Text(
                                  item['item_name'],
                                  style: const TextStyle(color: Colors.black),
                                ),
                                dense: true,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ItemDetailsPage.routeName);
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      );

                      // Text('${deptData[index]['name']}');
                    },
                  ),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      child: _buildActivePickUpItem(index),
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

  Widget _buildActivePickUpItem(int index) {
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
                            )
                          ],
                        )),
                        // Expanded(
                        //     child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     const Text('Delivery Time'),
                        //     SizedBox(
                        //       width: 8.w,
                        //     ),
                        //     Row(
                        //       children: [
                        //         Icon(
                        //           Icons.access_time,
                        //           size: 22.sp,
                        //         ),
                        //         Text('10am',
                        //             style: TextStyle(
                        //                 fontSize: 18.sp, color: Colors.black))
                        //       ],
                        //     )
                        //   ],
                        // ))
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

  Widget _buildPickUpItem(int index) {
    var itemList = [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemBuilder: (context, index) {
              itemList = data[index]['items'];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tilePadding: EdgeInsets.symmetric(horizontal: 10.w),
                  // collapsedBackgroundColor: Colors.black38,
                  // backgroundColor: Colors.black38,
                  title: Text(
                    data[index]['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  children: itemList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ListTile(
                        style: ListTileStyle.list,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        // leading: Icon(Icons.ac_unit_sharp),
                        title: Text(
                          item['item_name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                        dense: true,
                        onTap: () {
                          Navigator.pushNamed(
                              context, ItemDetailsPage.routeName);
                        },
                      ),
                    );
                  }).toList(),
                ),
              );

              // Text('${deptData[index]['name']}');
            },
          ),
        ),
      ),
    );
  }
}
