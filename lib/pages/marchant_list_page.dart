import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flybee/pages/item_details.dart';
import 'package:flybee/utils/colors.dart';

class MarchantListPage extends StatefulWidget {
  static const String routeName = '/items';
  const MarchantListPage({super.key});

  @override
  State<MarchantListPage> createState() => _MarchantListPageState();
}

class _MarchantListPageState extends State<MarchantListPage> {
  List data = [
    {
      'name': 'shamim',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
        {
          'item_name': 'item 4',
          'item_price': '20',
        },
        {
          'item_name': 'item 5',
          'item_price': '20',
        },
      ],
    },
    {
      'name': 'shakil',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
        {
          'item_name': 'item 4',
          'item_price': '20',
        },
      ],
    },
    {
      'name': 'syed',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
      ],
    },
    {
      'name': 'habib',
      "items": [
        {
          'item_name': 'item 1',
          'item_price': '20',
        },
        {
          'item_name': 'item 2',
          'item_price': '20',
        },
        {
          'item_name': 'item 3',
          'item_price': '20',
        },
        {
          'item_name': 'item 4',
          'item_price': '20',
        },
        {
          'item_name': 'item 5',
          'item_price': '20',
        },
        {
          'item_name': 'item 6',
          'item_price': '20',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    var itemList = [];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
              itemBuilder: (context, index) {
                itemList = data[index]['items'];
                return Theme(
                  data: ThemeData(
                    expansionTileTheme: const ExpansionTileThemeData(
                      tilePadding: EdgeInsets.all(0),
                      collapsedIconColor: logogold,
                      iconColor: logoblue,
                      textColor: Colors.black,
                      collapsedTextColor: Colors.black26,
                    ),
                  ),
                  child: Card(
                    elevation: 10,
                    color: Colors.grey[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      tilePadding: EdgeInsets.symmetric(horizontal: 10.w),
                      // collapsedBackgroundColor: Colors.black38,
                      // backgroundColor: Colors.black38,
                      title: Text(
                        data[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      children: itemList.map((item) {
                        log(item.toString());
                        return Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: ListTile(
                            
                            style: ListTileStyle.list,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            // leading: Icon(Icons.ac_unit_sharp),
                            title: Text(item['item_name'], style: TextStyle(color: Colors.white),),
                            dense: true,
                            onTap: () {
                              Navigator.pushNamed(context, ItemDetailsPage.routeName);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
        
                // Text('${deptData[index]['name']}');
              },
            ),
          ),
        ),
      ),
    );
  }
}
