import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  static const String routeName ='/delivery';
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Delivery'),),
    );
  }
}
