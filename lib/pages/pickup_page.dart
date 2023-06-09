import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickUpPage extends StatefulWidget {
  static const String routeName = '/pickup';

  const PickUpPage({Key? key}) : super(key: key);

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> with TickerProviderStateMixin {
  late TabController _tabController;

  int _expandedIndex = -1;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleExpanded(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = -1;
      } else {
        _expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PickUpList'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue.withOpacity(0.15),
            ),
            tabs: const [
              Tab(text: 'Pickup List'),
              Tab(text: 'Active Pickup List'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content of the first tab (Pickup List)
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(height: 50,);
                    // return Container(
                    //   height: _expandedIndex == index ? 100.h : 50.h,
                    //   child: _buildItem(index),
                    // );
                  },
                ),
                const Center(
                  child: Text(
                    'Active Pickup List',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    final isExpanded = _expandedIndex == index;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded ? 100.h : 50.h,
      color: isExpanded ? Colors.blue : Colors.grey,
      margin: EdgeInsets.all(8),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Merchant $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      onPressed: () => _toggleExpanded(index),
                      icon: isExpanded
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down_outlined))
                ],
              ),
            ),
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, innerIndex) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
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
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Store Address'),
                              const Row(
                                children: [
                                  Icon(Icons.location_pin),
                                  Expanded(
                                      child: Text(
                                    'Dhaka',
                                    style: TextStyle(fontSize: 20),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text('User Address'),
                              const Row(
                                children: [
                                  Icon(Icons.location_pin),
                                  Expanded(
                                      child: Text(
                                    ('Chittagong'),
                                    style: TextStyle(fontSize: 20),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        )),
                        child: const Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order Pickup Time'),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    Text('8am',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black))
                                  ],
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Delivery Time'),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    Text('10am',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black))
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
                      SingleChildScrollView(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF01B075),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(8), // <-- Radius
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                              child: Text(
                                'Accept',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            ElevatedButton(
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
                                'Cancel',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
