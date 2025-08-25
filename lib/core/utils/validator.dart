
import 'package:ecommerce_elk/core/constant/app_values.dart';

class Validator {
  Validator._();

  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      AppValues.emailRegex,
    );
    if (val == null) {
      return "Email can't be empty.";
    } else if (val.trim().isEmpty) {
      return "Email can't be empty.";
    } else if (emailRegex.hasMatch(val) == false) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(AppValues.passwordRegex);
    if (val == null) {
      return "Password can't be empty.";
    } else if (val.isEmpty) {
      return "Password can't be empty.";
    } else if (!passwordRegex.hasMatch(val)) {
      return "Please enter a valid password.";
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return "Password can't be empty.";
    } else if (val != password) {
      return "Confirm password must match password.";
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return "Name can't be empty.";
    } else {
      return null;
    }
  }

}
