import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.pink[AppColors.colorCode50],
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.pink[AppColors.colorCode50],
    ),
    tabBarTheme: TabBarThemeData(
      splashFactory: NoSplash.splashFactory,
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      labelColor: AppColors.pink[AppColors.colorCode40],
      indicatorColor: AppColors.pink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          AppColors.pink[AppColors.colorCode50],
        ),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10000)),
        ),
        elevation: WidgetStateProperty.all(0),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(14)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
      contentPadding: const EdgeInsets.all(16),
      iconColor: AppColors.lightPink,
      hintStyle: TextStyle(
        color: AppColors.black[AppColors.colorCode30],
        fontSize: 14,
      ),
      prefixIconColor: AppColors.black,
      suffixIconColor: AppColors.black,
      labelStyle: TextStyle(
        fontSize: 12,
        color: AppColors.black[AppColors.colorCode40],
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.black),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.red),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      surfaceTintColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.all(
          AppColors.pink[AppColors.colorCode50],
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: AppColors.pink[AppColors.colorCode50],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.gray,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        color: AppColors.pink[AppColors.colorCode50],
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(fontSize: 14, color: AppColors.gray),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),

      labelMedium: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),

      bodySmall: TextStyle(
        color: AppColors.gray,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      ),
    ),
  );
}
