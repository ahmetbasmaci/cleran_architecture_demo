// ignore_for_file: prefer_const_constructors

import 'package:cleran_architecture_demo/core/utils/app_coolors.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily.name,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
