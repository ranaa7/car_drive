import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(
    {required String message,
    required Color bcColor,
    ToastGravity gravity = ToastGravity.BOTTOM}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 5,
      backgroundColor: bcColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}
