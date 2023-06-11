import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountPage extends StatefulWidget {
  static const String routeName = '/account';
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    
    _tabController = TabController(length: 2, vsync: this);


    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/placholder.png'),
            ),
             SizedBox(height: 16.h),
             Text(
              'Xyz',
              style: TextStyle(
                  fontSize: 24.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
             SizedBox(height: 8.h),
             Text(
              'Rider',
              style: TextStyle(
                fontSize: 16.h,
                color: Colors.grey,
              ),
            ),
             SizedBox(height: 10.h),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'xyz@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+8801647383443',
                  style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 16.h),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: const Color(0xFFfebe07),
              tabs: const [
                Tab(text: 'Collection'),
                Tab(text: 'Total'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 60.h,
                                width: 350.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const ListTile(
                                  leading: Icon(Icons.email),
                                  title: Text('johndoe@example.com'),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                   Center(
                    child: Text(
                      'Total Page',
                      style: TextStyle(fontSize: 24.h),
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
}
