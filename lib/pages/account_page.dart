import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/utils/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
    
    double screenWidth = MediaQuery.of(context).size.width;
    _tabController = TabController(length: 2, vsync: this);


    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Stack(
                  children: [
                    Container(
                      height: 290.h,width: screenWidth-30.w,
                      decoration: BoxDecoration(
                        color: logogold,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Positioned(
                        top: 0,left: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SizedBox(
                            width: screenWidth-30,
                            height: 50.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "12,000 ৳",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Icon(Icons.navigate_next,color: Colors.white,size: 40.sp,)
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 1.25,left: 0.5,right: 0.5,top: 40,
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
                            const Text(
                              'Mr Donald',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Branch ID: DHK-015',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15.h),

                            Container(
                              height: 40.h,width: screenWidth-50.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
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
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
                  child: const ListTile(
                    leading: Icon(Icons.email),
                    trailing: Icon(Icons.verified_user_outlined,color: Colors.green,),
                    title: Text(
                      'johndoe@example.com',
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
                  child: const ListTile(
                    leading: Icon(Icons.phone_android),
                    trailing: Icon(Icons.verified_user_outlined,color: Colors.red,),
                    title: Text(
                      '+88017000000000',
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
                  child: const ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text(
                      'Banani, Dhaka',
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
                  child: const ListTile(
                    leading: Icon(Icons.business_center_outlined),
                    title: Text(
                      'Dutch Bangla Bank',
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
                  child: const ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text(
                      'Rider',
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
                  child: const ListTile(
                    leading: Icon(Icons.featured_video_outlined),
                    trailing:Icon(Icons.navigate_next) ,
                    title: Text(
                      'NID',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const Divider(),
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
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: const Color(0xFFfebe07),
                  tabs: const [
                    Tab(text: 'Commission'),
                    Tab(text: 'Delivery'),
                  ],
                ),
                SizedBox(
                  height: 340.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Stack(
                        children: [
                          // Center(
                          //   child: Padding(
                          //     padding:  EdgeInsets.symmetric(vertical: 8.0),
                          //     child: Container(
                          //       height: 340.h,width: screenWidth-30.w,
                          //       decoration: BoxDecoration(
                          //           color: logogold,
                          //           borderRadius: BorderRadius.circular(12)
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            top: 1,
                            left: 15.w,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 25.0),
                                child: Container(
                                  height: 230.h,width: screenWidth-30.w,
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
                                          child: const ListTile(
                                            trailing: Text("4000 ৳"),
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
                                          child: const ListTile(
                                            trailing: Text("4%"),
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
                                          child: const ListTile(
                                            trailing: Text("3000 ৳"),
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
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding:  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 340.h,width: screenWidth-30.w,
                                decoration: BoxDecoration(
                                    color: logogold,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 15.w,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  height: 260.h,width: screenWidth-30.w,
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
                                          child: const ListTile(
                                            trailing: Text("2500 ৳"),
                                            title: Text(
                                              'Cost Ammount',
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
                                          child: const ListTile(
                                            trailing: Text("2%"),
                                            title: Text(
                                              'Cost Percent',
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
                                          child: const ListTile(
                                            trailing: Text("3000 ৳"),
                                            title: Text(
                                              'Rider Ammount',
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
                                          child: const ListTile(
                                            trailing: Text("2000 ৳"),
                                            title: Text(
                                              'Rider Withdraw',
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
                          Positioned(
                              bottom: 15.h,left: 16.w,
                              child: SizedBox(
                                height: 50.h,width: screenWidth-30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(onPressed: (){
                                      showFlexibleBottomSheet(
                                        minHeight: 0,
                                        initHeight: 0.3,
                                        maxHeight: 1,
                                        context: context,
                                        builder: collectionbuildBottomSheet,
                                        anchors: [0, 0.5, 1],
                                        isSafeArea: true,
                                      );
                                    },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: logoblue,
                                            textStyle: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500)),
                                        child: SizedBox(height:20.h, width: 70.w,
                                            child: const Center(child: Text("Collection")))),
                                    ElevatedButton(onPressed: (){
                                      showFlexibleBottomSheet(
                                        minHeight: 0,
                                        initHeight: 0.3,
                                        maxHeight: 1,
                                        context: context,
                                        builder: totalbuildBottomSheet,
                                        anchors: [0, 0.5, 1],
                                        isSafeArea: true,
                                      );
                                    },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: logoblue,
                                            textStyle: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500)),
                                        child:  SizedBox(height:20.h, width: 70.w,
                                            child: const Center(child: Text("Total"))))
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                  'Paid Collection Ammount',
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
                  'Due Collection Ammount',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
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

}
