import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFC8892A); // golden brown
  static const primaryDark = Color(0xFF9E6A1A);
  static const surfaceColor = Color(0xFFFDF8F2); // warm white
  static const cardBg = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF1A1A1A);
  static const textLight = Color(0xFF888888);
  static const border = Color(0xFFE8D5B5);
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.surfaceColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        useMaterial3: true,
      );
}
