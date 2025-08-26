import 'package:flutter/material.dart';
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
            content: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
