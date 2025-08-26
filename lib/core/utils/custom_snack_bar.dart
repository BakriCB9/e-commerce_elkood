import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static showSnackBar(BuildContext context, String message, {Color? color}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1200),
        backgroundColor: color ?? AppColors.green,
        content: Text(message),
      ),
    );
  }
}
