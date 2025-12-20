import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast({
  Color bgColor = Colors.red,
  Color textColor = Colors.white,
  String text = '',
  ToastGravity placement = ToastGravity.BOTTOM
}) {
  WidgetsBinding.instance.addPostFrameCallback((_){
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: placement,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 14,
    );
  });
}