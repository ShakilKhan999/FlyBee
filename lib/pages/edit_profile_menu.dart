
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';




class EditProfileMenu extends StatefulWidget {
  @override
  State<EditProfileMenu> createState() => _ChangePasswordMenuState();
}
bool visiblepass = true;
bool visiblepass2 = true;
class _ChangePasswordMenuState extends State<EditProfileMenu> {


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AlertDialog(
      content: Container(
        height: 450.h,
        child: Padding(
          padding: EdgeInsets.all(4.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_note,size: 45.sp,color: Colors.black,),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline_sharp,
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
                      labelText: 'First Name',
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
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline_sharp,
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
                      labelText: 'Last Name',
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
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.edit_location_alt_outlined,
                        color: Color(0xFF032178),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFfebe07), width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.2)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.2)),
                      labelText: 'Address',
                      labelStyle:
                      TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Color(0xFF032178),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFfebe07), width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.2)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.2)),
                      labelText: 'Email',
                      labelStyle:
                      TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color(0xFF032178),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFfebe07), width: 1.2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.2)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.2)),
                      labelText: 'Mobile',
                      labelStyle:
                      TextStyle(color: Colors.black)),
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
                    'Update',
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
