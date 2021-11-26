import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'color_swatch_generator.dart';

class AppLightTheme {
  static final ThemeData theme = ThemeData(
      appBarTheme: _appBarTheme,
      brightness: Brightness.light,
      primarySwatch: generateMaterialColor(AppColors.darkBlueColor),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: AppColors.darkBlueColor,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData);

  static const AppBarTheme _appBarTheme = AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light),
      color: Colors.transparent,
      elevation: 0.0);

  static const BottomNavigationBarThemeData _bottomNavigationBarThemeData =
      BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.darkBlueColor,
          unselectedItemColor: AppColors.darkerGreyColor);
}
