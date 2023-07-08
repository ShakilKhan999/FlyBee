
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';




class ChangePasswordMenu extends StatefulWidget {
  @override
  State<ChangePasswordMenu> createState() => _ChangePasswordMenuState();
}
bool visiblepass = true;
bool visiblepass2 = true;
class _ChangePasswordMenuState extends State<ChangePasswordMenu> {


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AlertDialog(
      content: Container(
        height: 250,
        child: Padding(
          padding: EdgeInsets.all(4.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.vpn_key_outlined,size: 45.sp,color: Colors.black,),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
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
                      labelText: 'Old Password',
                      labelStyle:
                      const TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  obscureText: !visiblepass2,
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
                      suffixIcon: visiblepass2
                          ? IconButton(
                          onPressed: () {
                            setState(() {
                              visiblepass2
                                  ? visiblepass2 = false
                                  : visiblepass2 = true;
                            });
                          },
                          icon: const Icon(Icons.visibility,
                              color: Color(0xFF032178)))
                          : IconButton(
                          onPressed: () {
                            setState(() {
                              visiblepass2
                                  ? visiblepass2 = false
                                  : visiblepass2 = true;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                            color: Color(0xFF032178),
                          )),
                      labelText: 'New Password',
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
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
