import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flybee/pages/account_page.dart';
import 'package:flybee/pages/delivery_page.dart';
import 'package:flybee/pages/pickup_page.dart';
import 'package:flybee/widgets/main_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/delivery_provider.dart';
import '../providers/login_provider.dart';
import '../utils/colors.dart';
import '../utils/shared_preference.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
String? name,id,mobile,mail,branch_id,nid,bank,address;
class _HomePageState extends State<HomePage> {
  
  int pageIndex = 0;
  List<Widget> widgetList = const [PickUpPage(), DeliveryPage(), AccountPage()];
  late LoginProvider loginProvider;
@override
void initState() {
  loginProvider = Provider.of<LoginProvider>(context, listen: false);
  super.initState();
  getinfo();
}
  void getinfo()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name =await prefs.getString(USER_NAME);
    // basicUserInfoModel.id=await prefs.getString(USER_ID);
    mobile=await prefs.getString(USER_PHONE);
    mail=await prefs.getString(USER_EMAIL);
    branch_id=await prefs.getString(BRANCH_ID);
    nid=await prefs.getString(NID);
    bank=await prefs.getString(BANK);
    address=await prefs.getString(USER_ADDRESS);
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Connectivity connectivity = Connectivity();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Image.asset('images/logo.png', height: 30, width: 120),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: const MainDrawer(),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
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
              backgroundColor: const Color(0xFF032178),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color(0xFFfebe07),
              padding: const EdgeInsets.all(16),
              onTabChange: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              selectedIndex: pageIndex,
              // currentIndex: pageIndex,
              tabs: const [
                GButton(
                  icon: Icons.hail,
                  text: 'Pick up',
                ),
                GButton(
                  icon: Icons.delivery_dining_rounded,
                  text: 'Delivery',
                ),
                GButton(icon: Icons.person, text: 'Account')
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
                                      child: const Text(
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
