import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'app_colors.dart';
import 'color_swatch_generator.dart';

class AppLightTheme {
  static final ThemeData theme = ThemeData(
      appBarTheme: _appBarTheme,
      brightness: Brightness.light,
      primarySwatch: generateMaterialColor(AppColors.lightBlueColor),
      backgroundColor: Colors.white,
      fontFamily: 'Avenir',
      textTheme: _textTheme,
      scaffoldBackgroundColor: AppColors.lightBlueColor,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
      elevatedButtonTheme: _elevatedButtonTheme);

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

  static const TextTheme _textTheme = TextTheme(
    button: TextStyle(color: AppColors.whiteColor),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        AppColors.lightBlueColor,
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        AppColors.whiteColor,
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(AppDimension.paddingMedium),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimension.borderRadiusSmall),
        ),
      ),
    ),
  );
}
