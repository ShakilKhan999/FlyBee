import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flybee/pages/account_page.dart';
import 'package:flybee/pages/delivery_page.dart';
import 'package:flybee/pages/pickup_page.dart';
import 'package:flybee/widgets/main_drawer.dart';
import '../utils/colors.dart';
class HomePage extends StatefulWidget {
  static const String routeName ='/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List<Widget> widgetList = const [
    PickUpPage(),
    DeliveryPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    Connectivity connectivity=Connectivity();
    return Scaffold(
      drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },

          currentIndex: pageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Pick up',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_rounded),
              label: 'Delivery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'account',
            ),
          ],
        ),
        body:StreamBuilder(
          stream: connectivity.onConnectivityChanged,
          builder: (_, snapshot){
            return snapshot.connectionState==ConnectionState.active?
            snapshot.data!=ConnectivityResult.none?
            Center(
              child: widgetList[pageIndex],
            ): Center(
              child: Center(
                child: Stack(
                  children: [
                    Image.asset('images/nointernet.PNG',height: screenHeight,width: screenWidth,fit: BoxFit.contain,),
                     Positioned(
                        bottom: screenHeight-700,
                        left: screenWidth-320,
                        child: const Column(
                          children: [
                            Text('You Are Offline Now!',style: TextStyle(color: orangetextcol,fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Text('Go online, accept your orders and make',style: TextStyle(color: orangetextcol,fontSize: 15)),
                            SizedBox(height: 5,),
                            Text('customer happy with your service',style: TextStyle(color:orangetextcol,fontSize: 15)),
                          ],
                        )
                    ),
                    Positioned(
                        bottom:20,
                        left: 15,
                        child: SizedBox(
                          width: screenWidth-30,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: firstbuttoncolor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(8), // <-- Radius
                              ),
                            ),
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, HomePage.routeName);
                            },
                            child: Text('Go Online',style: TextStyle(fontSize: 20),),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ):Center(
              child: widgetList[pageIndex],
            );
          },)
    );
  }
}
