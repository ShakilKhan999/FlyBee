
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/pages/home_page.dart';
import 'package:flybee/providers/account_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import '../utils/shared_preference.dart';




class EditProfileMenu extends StatefulWidget {
  @override
  State<EditProfileMenu> createState() => _ChangePasswordMenuState();
}
bool visiblepass = true;
bool visiblepass2 = true;
final TextEditingController unameController = TextEditingController();
final TextEditingController fnameController = TextEditingController();
final TextEditingController lnameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phnController = TextEditingController();
class _ChangePasswordMenuState extends State<EditProfileMenu> {
late AccountProvider accountProvider;

@override
  void initState() {
  accountProvider = Provider.of<AccountProvider>(context, listen: false);
  unameController.text=name!;
  emailController.text=mail!;
  addressController.text=address!;
  phnController.text=mobile!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: AlertDialog(
        content: Container(
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
                  height: 60.h,
                  child: TextFormField(
                    controller: unameController,
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
                        labelText: 'User Name',
                        labelStyle:
                        const TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    controller: fnameController,
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
                    controller: lnameController,
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
                    controller: addressController,
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
                    controller: emailController,
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
                    controller: phnController,
                    keyboardType: TextInputType.phone,
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
                      if(unameController.text==null || unameController.text==''){
                        var sn = const SnackBar(
                            content:
                            Text('Enter User Name'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else if(fnameController.text==null || fnameController.text==''){
                        var sn = const SnackBar(
                            content:
                            Text('Enter First Name'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else if(lnameController.text==null || lnameController.text==''){
                        var sn = const SnackBar(
                            content:
                            Text('Enter Last Name'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else if(addressController.text==null || addressController.text==''){
                        var sn = const SnackBar(
                            content:
                            Text('Enter Address'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else if(emailController.text==null || emailController.text==''){
                        var sn = const SnackBar(
                            content:
                            Text('Enter email'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else if(accountProvider.isEmailFormatValid(emailController.text)){
                        var sn = const SnackBar(
                            content:
                            Text('Enter valid email'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else if(phnController.text==null || phnController.text==''){
                        var sn = const SnackBar(
                            content:
                            Text('Enter phone number'));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(sn);
                      }
                      else{
                        await accountProvider.updateProfile(
                            unameController.text,
                            fnameController.text,
                            lnameController.text,
                            addressController.text,
                            emailController.text,
                            phnController.text);
                        setState(() {
                          getinfo();
                        });
                        Navigator.of(context).pop();
                      }
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
      ),
    );
  }
}
