import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/core/constant/app_values.dart';
import 'package:ecommerce_elk/core/utils/app_shared_prefrence.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.pink[AppColors.colorCode40],
                child: Icon(Icons.person),
              ),
              const SizedBox(height: 10),
              Text(
                SharedPreferencesUtils.getString(AppValues.userName) ?? "User",
              ),
              Text(
                SharedPreferencesUtils.getString(AppValues.email) ??
                    "User@gmail.com",
              ),
              const SizedBox(height: 40),
              OptionOfProfile(title: "About us"),
              const SizedBox(height: 20),
              OptionOfProfile(title: "Terms and Conditions"),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionOfProfile extends StatelessWidget {
  final String title;
  const OptionOfProfile({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(title), Spacer(), Icon(Icons.arrow_forward_ios)],
    );
  }
}
