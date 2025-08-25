import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'loading_widget.dart';

class AppDialogs {
  // Show a loading dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          onPopInvokedWithResult: (value, _) async => false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(
              child: CircularProgressIndicator(color: AppColors.pink),
            ),
          ),
        );
      },
    );
  }
}
