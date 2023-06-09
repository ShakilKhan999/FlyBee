import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () async {},
            leading: const Icon(Icons.logout),
            title: const Text('LOGOUT'),
          ),
        ],
      ),
    );
  }
}
