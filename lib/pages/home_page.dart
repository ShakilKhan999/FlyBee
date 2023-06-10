import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flybee/pages/account_page.dart';
import 'package:flybee/pages/delivery_page.dart';
import 'package:flybee/pages/pickup_page.dart';
import 'package:flybee/widgets/main_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List<Widget> widgetList = const [PickUpPage(), DeliveryPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Connectivity connectivity = Connectivity();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Image.asset('images/logo.png', height: 50, width: 250),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xFF032178),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GNav(
              iconSize: 22,
              gap: 13,
              backgroundColor: Color(0xFF032178),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Color(0xFFfebe07),
              padding: EdgeInsets.all(16),
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              selectedIndex: pageIndex,
              // currentIndex: pageIndex,
              tabs: [
                GButton(
                  icon: Icons.hail,
                  text: 'Pick up',
                ),
                GButton(
                  icon: Icons.delivery_dining_rounded,
                  text: 'Delivery',
                ),
                GButton(icon: Icons.person, text: 'account')
              ],
            ),
          ),
        ),
        body: StreamBuilder(
          stream: connectivity.onConnectivityChanged,
          builder: (_, snapshot) {
            return snapshot.connectionState == ConnectionState.active
                ? snapshot.data != ConnectivityResult.none
                    ? Center(
                        child: widgetList[pageIndex],
                      )
                    : Center(
                        child: Center(
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/nointernet.PNG',
                                height: screenHeight,
                                width: screenWidth,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                  bottom: screenHeight - 700,
                                  left: screenWidth - 320,
                                  child: const Column(
                                    children: [
                                      Text(
                                        'You Are Offline Now!',
                                        style: TextStyle(
                                            color: orangetextcol,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          'Go online, accept your orders and make',
                                          style: TextStyle(
                                              color: orangetextcol,
                                              fontSize: 15)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('customer happy with your service',
                                          style: TextStyle(
                                              color: orangetextcol,
                                              fontSize: 15)),
                                    ],
                                  )),
                              Positioned(
                                  bottom: 20,
                                  left: 15,
                                  child: SizedBox(
                                    width: screenWidth - 30,
                                    height: 45,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: firstbuttoncolor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8), // <-- Radius
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, HomePage.routeName);
                                      },
                                      child: Text(
                                        'Go Online',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      )
                : Center(
                    child: widgetList[pageIndex],
                  );
          },
        ));
  }
}
// showSelectedLabels: false,
// showUnselectedLabels: false,
// type: BottomNavigationBarType.fixed,
// backgroundColor: Colors.white,
// onTap: (index) {
// setState(() {
// pageIndex = index;
// });
// },
// currentIndex: pageIndex,
