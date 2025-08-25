import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

typedef ValidateData = String? Function(String? value)?;

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final ValidateData validate;
  final TextEditingController controller;
  const CustomTextFormField({
    required this.hint,
    required this.label,
    required this.controller,
    this.validate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      cursorColor: AppColors.pink,
      validator: validate,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(labelText: label, hintText: hint),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
