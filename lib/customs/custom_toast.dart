import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast(String message) {
  FToast fToast = FToast();

  // Define the colors for the gradient background
  Color color1 = Colors.amber;
  Color color2 = Colors.indigo;

  // Create the gradient background
  BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [color1, color2],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  Widget toast = Container(
    decoration: gradientBackground, // Apply the gradient background
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    child: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
  );

  fToast.showToast(
    child: toast,
    toastDuration: Duration(seconds: 3),
    gravity: ToastGravity.BOTTOM,
  );
}

// Usage:

