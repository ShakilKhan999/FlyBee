import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/pages/account_page.dart';
import 'package:flybee/pages/delivery_page.dart';
import 'package:flybee/pages/item_details.dart';
import 'package:flybee/pages/login_page.dart';
import 'package:flybee/pages/marchant_list_page.dart';
import 'package:flybee/pages/pickup_page.dart';
import 'package:flybee/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:flybee/pages/home_page.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider())
      ],
    child:  const MyApp()));
  //check
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 860),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: LoginPage.routeName,
            routes: {
              LoginPage.routeName: (context) => LoginPage(),
              HomePage.routeName:(context)=> HomePage(),
              PickUpPage.routeName:(context)=>PickUpPage(),
              DeliveryPage.routeName:(context)=>DeliveryPage(),
              AccountPage.routeName:(context)=>AccountPage(),
              MarchantListPage.routeName:(context)=>MarchantListPage(),
              ItemDetailsPage.routeName:(context)=>ItemDetailsPage(),

            },
          );
        });
  }
}
