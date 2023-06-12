import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flybee/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/';
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklog();
  }
  void checklog()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('accessToken');
    if(token!="logout")
    {
      Navigator.pushReplacementNamed(
          context, HomePage.routeName);
    }
    else{
      Navigator.pushReplacementNamed(
          context, LoginPage.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(color: Colors.white,),
    );
  }
}
