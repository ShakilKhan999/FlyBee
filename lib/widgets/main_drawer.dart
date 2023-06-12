import 'package:flutter/material.dart';
import 'package:flybee/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
     
          ListTile(
            onTap: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('accessToken','logout');
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
            leading: const Icon(Icons.logout),
            title: const Text('LOGOUT'),
          ),
        ],
      ),
    );
  }
}
