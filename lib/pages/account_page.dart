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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    _tabController = TabController(length: 2, vsync: this);
    bool _showFirstTabBottomSheet = false;
    bool _showSecondTabBottomSheet = false;

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/placholder.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Kuddus',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              'Software Developer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'johndoe@example.com',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
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
              indicatorColor: Color(0xFFfebe07),
              tabs: [
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
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                                child: ListTile(
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
                      style: TextStyle(fontSize: 24),
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
