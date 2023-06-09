import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/pages/home_page.dart';
import 'package:flybee/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../customs/custom_snack_bar.dart';
import '../customs/custom_snack_bar_icon.dart';
import '../utils/colors.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static const String routeName = '/logpage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final IconData iconData = Icons.visibility;
  bool ActiveConnection = false;
  bool visiblepass = false;
  bool status = false;
  String errMsg = '';
  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Image.asset(
                    'images/logo.png',
                    height: 150.h,
                    width: 250.w,
                  ),
                ),
                Container(
                  height: 450.h,
                  width: 400.w,
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       logoblue,
                  //       logogold,
                  //     ],
                  //   ),
                  //   color: themeColorBlue,
                  //   borderRadius: BorderRadius.circular(15),
                  //   border: Border.all(color: logogold, width: 1.5),
                  // ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFfebe07), width: 1.2)),
                              prefixIcon: Icon(Icons.mail_outline,
                                  color: Color(0xFF032178)),
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.2)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.2)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !visiblepass,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock_outlined,
                                  color: Color(0xFF032178),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFfebe07), width: 1.2)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.2)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.2)),
                                suffixIcon: visiblepass
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            visiblepass
                                                ? visiblepass = false
                                                : visiblepass = true;
                                          });
                                        },
                                        icon: const Icon(Icons.visibility,
                                            color: Color(0xFF032178)))
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            visiblepass
                                                ? visiblepass = false
                                                : visiblepass = true;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.visibility_off,
                                          color: Color(0xFF032178),
                                        )),
                                labelText: 'Password',
                                labelStyle:
                                    const TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: mediaQuery.size.width,
                          height: 40.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: logoblue,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                              ),
                              onPressed: () async {
                                // bool login= await loginProvider.login(emailController.text, passwordController.text);
                                //   login?  Navigator.pushReplacementNamed(context, HomePage.routeName):CustomSnackBar().showSnackBar(
                                //             context: context,
                                //             content: 'Wrong Email or Password',
                                //             backgroundColor: Colors.green);


                                if (emailController.text == '') {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content: 'Enter Email',
                                      backgroundColor: Colors.red);
                                  return;
                                }
                                if (passwordController.text == '') {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content: 'Enter Password',
                                      backgroundColor: Colors.red);
                                  return;
                                }
                                if (passwordController.text.length < 6) {
                                  CustomSnackBar().showSnackBar(
                                      context: context,
                                      content:
                                          'Password length must be at least 6',
                                      backgroundColor: Colors.red);
                                  return;
                                }
                                if (ActiveConnection == false) {
                                  try {
                                    final result = await InternetAddress.lookup(
                                        'example.com');
                                    if (result.isNotEmpty &&
                                        result[0].rawAddress.isNotEmpty) {

                                      bool login= await loginProvider.login(emailController.text, passwordController.text);
                                     if(login == true){
                                       Navigator.pushReplacementNamed(context, HomePage.routeName);
                                       CustomSnackBar().showSnackBar(
                                                   context: context,
                                                   content: 'Log in Successful',
                                                   backgroundColor: Colors.green);
                                     } else{
                                       CustomSnackBar().showSnackBar(
                                           context: context,
                                           content: 'Wrong Email or Password',
                                           backgroundColor: Colors.green);
                                     }

                                      //  method
                                    }
                                  } on SocketException catch (_) {
                                    CustomIconSnackBar().showSnackBar(
                                      context: context,
                                      content: Icon(Icons.wifi),
                                    );
                                  }
                                } else {

                                  //  method
                                  bool login= await loginProvider.login(emailController.text, passwordController.text);
                                  if(login == true){
                                    Navigator.pushReplacementNamed(context, HomePage.routeName);
                                    CustomSnackBar().showSnackBar(
                                        context: context,
                                        content: 'Log in Successful',
                                        backgroundColor: Colors.green);
                                  } else{
                                    CustomSnackBar().showSnackBar(
                                        context: context,
                                        content: 'Wrong Email or Password',
                                        backgroundColor: Colors.green);
                                  }
                                }


                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.h),
                              )),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: const Color(0xFFfebe07),
                                  fontSize: 17.h,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 30.h,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont have an account?',
                                style: TextStyle(
                                    color: Color(0xFFfebe07), fontSize: 17.h),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                'Contact With Admin',
                                style: TextStyle(
                                    color: Color(0xFF032178),
                                    fontSize: 15.h,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // void login() async{
  //   try{
  //     await loginProvider.login(emailController.text, passwordController.text).then((value){
  //       Navigator.pushReplacementNamed(context, HomePage.routeName);
  //       CustomSnackBar().showSnackBar(
  //           context: context,
  //           content: 'Log in Successful',
  //           backgroundColor: Colors.green);
  //     });
  //   }catch(e){
  //     CustomSnackBar().showSnackBar(
  //         context: context,
  //         content: 'Wrong Email or Password',
  //         backgroundColor: Colors.green);
  //   }
  // }

}
