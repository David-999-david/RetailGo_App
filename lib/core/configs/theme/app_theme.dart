import 'package:flutter/material.dart';
import 'package:retail/core/configs/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: AppColors.scaffoldBackgroundColor,
      surfaceTintColor: AppColors.appbarStatusBarColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.borderBackground,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
