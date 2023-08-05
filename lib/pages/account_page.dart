
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/pages/change_pass_menu.dart';
import 'package:flybee/pages/edit_profile_menu.dart';
import 'package:flybee/utils/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/account_provider.dart';
import '../providers/login_provider.dart';
import '../utils/shared_preference.dart';
import 'home_page.dart';

class AccountPage extends StatefulWidget {
  static const String routeName = '/account';
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {

  int _currentTabIndex = 0;
  late TabController _tabController;
  late LoginProvider loginProvider;
  DateTime selectedDate = DateTime.now();
  String date=DateTime.now().toString().substring(0,11);
  //var name,id,mobile,mail;
  ScrollController _scrollController = ScrollController();
  late AccountProvider accountProvider;
  double todayAmmount=5;

  @override
  void initState() {
    accountProvider = Provider.of<AccountProvider>(context, listen: false);
    getTodaysCollection(date=DateTime.now().toString().substring(0,10));
    print(todayAmmount);
    print("init123");
    super.initState();
  }
getTodaysCollection(String date) async{
    double amnt=0;
    amnt= await accountProvider.getCollectionAmmount(date==null?DateTime.now().toString().substring(0,10):date);
    setState(() {
      todayAmmount=amnt;
    });
}
  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    
    double screenWidth = MediaQuery.of(context).size.width;
    _tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: 290.h,width: screenWidth-30.w,
                  ),
                  // Positioned(
                  //     top: 0,left: 0,
                  //     // child: Padding(
                  //     //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //     //   child: SizedBox(
                  //     //     width: screenWidth-30,
                  //     //     height: 50.h,
                  //     //     child: Row(
                  //     //       crossAxisAlignment: CrossAxisAlignment.center,
                  //     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //       children: [
                  //     //         Text(
                  //     //           "12,000 ৳",
                  //     //           style: TextStyle(
                  //     //               fontSize: 20.sp,
                  //     //               fontWeight: FontWeight.bold,
                  //     //               color: Colors.white),
                  //     //         ),
                  //     //         IconButton(onPressed: (){
                  //     //           _scrollController.animateTo(
                  //     //             _scrollController.position.maxScrollExtent,
                  //     //             duration: Duration(milliseconds: 300),
                  //     //             curve: Curves.easeOut,
                  //     //           );
                  //     //
                  //     //         },
                  //     //             icon: Icon(Icons.navigate_next,color: Colors.white,size: 40.sp,))
                  //     //       ],
                  //     //     ),
                  //     //   ),
                  //     // )
                  // ),
                  Positioned(
                    bottom: 1.25,left: 0.5,right: 0.5,top: 20,
                    child: Container(
                      height: 250.h,width: screenWidth-30.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child:  Column(
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            height: 90.w,width: 90.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 1),
                                borderRadius: BorderRadius.circular(90)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset('images/img.png',height: 90.w,width: 90.w,fit: BoxFit.cover,),
                            ),
                          ),
                          const SizedBox(height: 10),
                           Text(
                            name.toString().length>12?name.toString().substring(0,9):name!,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Branch Name: $branch',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 15.h),

                            Container(
                              height: 40.h,width: screenWidth-80.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: address==""|| address==null?Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.location_pin,color: Colors.black,),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 10.sp,),
                                      Text(
                                        'Bangladesh',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 10.sp,),
                                      Text(
                                        'Dhaka',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle,size: 10.sp,),
                                      Text(
                                        'Banani',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10.w,)
                                ],
                              ):Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.location_pin,color: Colors.black,),
                                  Text( 'Address: $address',),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top:50.h,left:10.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Colors.white.withOpacity(0.4)
                          ),
                            child: PopupMenuButton<String>(
                              itemBuilder: (BuildContext
                              context) =>
                              <PopupMenuEntry<String>>[
                                const PopupMenuItem<String>(
                                  value: 'option1',
                                  child: Text('Edit'),
                                ),
                                const PopupMenuItem<String>(
                                  value: 'option2',
                                  child: Text(
                                      'Change Password'),
                                ),
                              ],
                              onSelected: (String value) {
                                // Handle option selection here
                                switch (value) {
                                  case 'option1':
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Opacity(opacity:0.9,child: EditProfileMenu());
                                      },
                                    ).then((value) {
                                      setState(() {
                                        getinfo();
                                      });
                                    });
                                    break;
                                  case 'option2':
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Opacity(opacity:0.9,child: ChangePasswordMenu());
                                      },
                                    );
                                    break;
                                }
                              },
                              icon:  Icon(
                                  Icons.edit,color: Colors.white,size: 24.sp,),
                            )))
                  ],
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 10.w,),
                      Container(
                        height: 140.h,width: 140.w,
                        decoration: BoxDecoration(
                            color: logoblue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 6.0,
                              percent: 0.8,
                              center:  const Text("8/10",style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.white,
                              progressColor: logoblue,
                            ),
                            SizedBox(height: 5.h,),
                            Text("Pickup Completed",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        height: 140.h,width: 140.w,
                        decoration: BoxDecoration(
                            color: logoblue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 6.0,
                              percent: 0.9,
                              center:  const Text("19/20",style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.white,
                              progressColor: logoblue,
                            ),
                            SizedBox(height: 5.h,),
                            Text("Delivered",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        height: 140.h,width: 140.w,
                        decoration: BoxDecoration(
                            color: logoblue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 6.0,
                              percent: 1.0,
                              center:  const Text("11",style: TextStyle(color: Colors.white,fontSize: 26),),
                              backgroundColor: Colors.white,
                              progressColor: Colors.green,
                            ),
                            SizedBox(height: 5.h,),
                            Text("Active Pickup",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        height: 140.h,width: 140.w,
                        decoration: BoxDecoration(
                            color: logoblue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 6.0,
                              percent: 1.0,
                              center:  const Text("15",style: TextStyle(color: Colors.white,fontSize: 26),),
                              backgroundColor: Colors.white,
                              progressColor: Colors.green,
                            ),
                            SizedBox(height: 5.h,),
                            Text("Active Delivery",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                    ],
                  ),
                ),
                SizedBox(height: 10.w,),
                Container(
                  height: 50.h,
                  width: screenWidth-20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                  ),
                  child:  ListTile(
                    leading: Icon(Icons.email),
                    trailing: Icon(Icons.verified_user_outlined,color: Colors.green,),
                    title: Text(
                      '$mail',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10.w,),
                Container(
                  height: 50.h,
                  width: screenWidth-20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                  ),
                  child:  ListTile(
                    leading: Icon(Icons.phone_android),
                    trailing: Icon(Icons.verified_user_outlined,color: Colors.red,),
                    title: Text(
                      '$mobile',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10.w,),
                Container(
                  height: 50.h,
                  width: screenWidth-20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                  ),
                  child:  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text(
                      '$address',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // SizedBox(height: 10.w,),
                // Container(
                //   height: 50.h,
                //   width: screenWidth-20.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       color: Colors.white
                //   ),
                //   child:  ListTile(
                //     leading: Icon(Icons.business_center_outlined),
                //     title: Text(
                //       '$bank',
                //       style: TextStyle(color: Colors.black),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10.w,),
                // Container(
                //   height: 50.h,
                //   width: screenWidth-20.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       color: Colors.white
                //   ),
                //   child: const ListTile(
                //     leading: Icon(Icons.person_outline),
                //     title: Text(
                //       'Rider',
                //       style: TextStyle(color: Colors.black),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10.w,),
                // Container(
                //   height: 50.h,
                //   width: screenWidth-20.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(12),
                //       color: Colors.white
                //   ),
                //   child: const ListTile(
                //     leading: Icon(Icons.featured_video_outlined),
                //     trailing:Icon(Icons.navigate_next) ,
                //     title: Text(
                //       'NID',
                //       style: TextStyle(color: Colors.black),
                //     ),
                //   ),
                // ),
                const Divider(),
                Padding(
                  padding:  EdgeInsets.all(5.sp),
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        Container(
                          height: 30,
                          width: screenWidth-100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: logogold
                          ),
                          child: Center(child: Text("৳ Balance",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w600),)),
                        ),
                        SizedBox(height: 15.h,),
                        TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: const Color(0xFFfebe07),


                          tabs: const [
                            Tab(text: 'Delivery'),
                            Tab(text: 'Commission'),
                          ],
                        ),
                        SizedBox(
                          height: 290.h,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Stack(
                                children: [
                                  // Center(
                                  //   // child: Container(
                                  //   //   height: 280.h,width: screenWidth-30.w,
                                  //   //   decoration: BoxDecoration(
                                  //   //       color: logogold,
                                  //   //       borderRadius: BorderRadius.circular(12)
                                  //   //   ),
                                  //   // ),
                                  // ),
                                  Positioned(
                                    top: 1,
                                    left: 10.w,
                                    right: 10.w,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Container(
                                          height: 120.h,width: screenWidth-30.w,
                                          decoration: BoxDecoration(
                                              color: logoblue,
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => _selectDate(context),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(width: 0.8,color: Colors.grey),
                                                              borderRadius: BorderRadius.circular(12)
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Text(
                                                              '$date',
                                                              style: TextStyle(color:Colors.white,fontSize: 14.sp, fontWeight: FontWeight.bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10.w,),
                                                Container(
                                                  height: 50.h,
                                                  width: screenWidth-20.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: Colors.white
                                                  ),
                                                  child:  ListTile(
                                                    trailing: Text("${todayAmmount} ৳"),
                                                    title: Text(
                                                      'Collect Ammount',
                                                      style: TextStyle(color: Colors.black),
                                                    ),
                                                  ),

                                                ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Positioned(
                                //     bottom: 15.h,left: 16.w,
                                //     child: SizedBox(
                                //       height: 50.h,width: screenWidth-30,
                                //       child: Row(
                                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //         children: [
                                //           ElevatedButton(onPressed: (){
                                //             showFlexibleBottomSheet(
                                //               minHeight: 0,
                                //               initHeight: 0.3,
                                //               maxHeight: 1,
                                //               context: context,
                                //               builder: collectionbuildBottomSheet,
                                //               anchors: [0, 0.5, 1],
                                //               isSafeArea: true,
                                //             );
                                //           },
                                //               style: ElevatedButton.styleFrom(
                                //                   backgroundColor: logoblue,
                                //                   textStyle: TextStyle(
                                //                       fontSize: 16.sp,
                                //                       fontWeight: FontWeight.w500)),
                                //               child: SizedBox(height:20.h, width: 70.w,
                                //                   child: const Center(child: Text("Collection")))),
                                //           ElevatedButton(onPressed: (){
                                //             showFlexibleBottomSheet(
                                //               minHeight: 0,
                                //               initHeight: 0.3,
                                //               maxHeight: 1,
                                //               context: context,
                                //               builder: totalbuildBottomSheet,
                                //               anchors: [0, 0.5, 1],
                                //               isSafeArea: true,
                                //             );
                                //           },
                                //               style: ElevatedButton.styleFrom(
                                //                   backgroundColor: logoblue,
                                //                   textStyle: TextStyle(
                                //                       fontSize: 16.sp,
                                //                       fontWeight: FontWeight.w500)),
                                //               child:  SizedBox(height:20.h, width: 90.w,
                                //                   child: const Center(child: Text("Commission"))))
                                //         ],
                                //       ),
                                //     )
                                //     )
                              ],
                            ),
                            Stack(
                              children: [
                                // Center(
                                //   child: Padding(
                                //     padding:  EdgeInsets.symmetric(vertical: 8.0),
                                //     child: Container(
                                //       height: 320.h,width: screenWidth-30.w,
                                //       decoration: BoxDecoration(
                                //           color: logogold,
                                //           borderRadius: BorderRadius.circular(12)
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                                    child: Container(
                                      height: 210.h,width: screenWidth-30.w,
                                      decoration: BoxDecoration(
                                          color: logoblue,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10.w,),
                                            Container(
                                              height: 50.h,
                                              width: screenWidth-20.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors.white
                                              ),
                                              child:  ListTile(
                                                trailing: Text("${accountProvider.commissionCalculator('total')} ৳"),
                                                title: Text(
                                                  'Total Commission',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10.w,),
                                            Container(
                                              height: 50.h,
                                              width: screenWidth-20.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors.white
                                              ),
                                              child:  ListTile(
                                                trailing: Text("${accountProvider.commissionCalculator('paid')} ৳"),
                                                title: Text(
                                                  'Paid Commission',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10.w,),
                                            Container(
                                              height: 50.h,
                                              width: screenWidth-20.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors.white
                                              ),
                                              child:  ListTile(
                                                trailing: Text("${accountProvider.commissionCalculator('due')} ৳"),
                                                title: Text(
                                                  'Due Commission',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget collectionbuildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Center(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 160.0),
              child: Divider(thickness: 3,color: Colors.black,),
            )),
            SizedBox(height: 10.w,),
            Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width-20.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
              ),
              child: const ListTile(
                trailing: Text("200 ৳"),
                title: Text(
                  'Collection Ammount',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // SizedBox(height: 10.w,),
            // Container(
            //   height: 50.h,
            //   width: MediaQuery.of(context).size.width-20.w,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: Colors.white
            //   ),
            //   child: const ListTile(
            //     trailing: Text("2000 ৳"),
            //     title: Text(
            //       'Paid Collection Ammount',
            //       style: TextStyle(color: Colors.black),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10.w,),
            // Container(
            //   height: 50.h,
            //   width: MediaQuery.of(context).size.width-20.w,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: Colors.white
            //   ),
            //   child: const ListTile(
            //     trailing: Text("2000 ৳"),
            //     title: Text(
            //       'Due Collection Ammount',
            //       style: TextStyle(color: Colors.black),
            //     ),
            //   ),
            // ),
          ],
        ),
      )
    );
  }

  Widget totalbuildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      ) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Center(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 160.0),
                child: Divider(thickness: 3,color: Colors.black,),
              )),
              SizedBox(height: 10.w,),
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width-20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: const ListTile(
                  trailing: Text("200 ৳"),
                  title: Text(
                    'Total Commission',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10.w,),
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width-20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: const ListTile(
                  trailing: Text("2000 ৳"),
                  title: Text(
                    'Total Withdraw',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10.w,),
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width-20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: const ListTile(
                  trailing: Text("2000 ৳"),
                  title: Text(
                    'Total Due',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Theme.of(context).primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = selectedDate.toString().substring(0, 11);
      });

      accountProvider.getCollectionAmmount(selectedDate.toString().substring(0, 10)).then((todayAmount) {
        getTodaysCollection(selectedDate.toString().substring(0, 10));
        setState(() {
          print("date:$date  collection: $todayAmmount");
        });
      });
    }
  }
}
