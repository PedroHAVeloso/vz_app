import 'package:flutter/material.dart';
import 'package:vz_app/ui/utils/app_colors.dart';

class AppTheme {
  static const Color primaryColor = AppColors.white;
  static const Color secondaryColor = AppColors.black;
  static const Color tertiaryColor = AppColors.grey;
  static const Color accentColor = AppColors.blue;
  static const Color surfaceColor = AppColors.lightGrey;

  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: primaryColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.blue,
        onPrimary: AppColors.white,
        secondary: AppColors.grey,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        background: AppColors.white,
        onBackground: AppColors.black,
        surface: AppColors.blue,
        onSurface: AppColors.white,
      ),
    );
  }
}
