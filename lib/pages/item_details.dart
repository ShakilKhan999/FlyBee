import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsPage extends StatefulWidget {
  static const String routeName = '/items_details';
  const ItemDetailsPage({super.key});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Marchant Address'),
                      const Row(
                        children: [
                          Icon(Icons.location_pin),
                          Expanded(
                              child: Text(
                            'Dhaka',
                            style: TextStyle(fontSize: 20),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text('Branch Address'),
                      const Row(
                        children: [
                          Icon(Icons.location_pin),
                          Expanded(
                              child: Text(
                            ('Chittagong'),
                            style: TextStyle(fontSize: 20),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                )),
                child: const Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pickup Time'),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            Text('8am',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))
                          ],
                        )
                      ],
                    )),
                    // Expanded(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text('Delivery Time'),
                    //       Row(
                    //         children: [
                    //           Icon(Icons.access_time),
                    //           Text('10am',
                    //               style: TextStyle(
                    //                   fontSize: 20, color: Colors.black))
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF01B075),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text(
                      'Accept',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
