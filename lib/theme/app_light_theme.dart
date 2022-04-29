import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'app_colors.dart';
import 'color_swatch_generator.dart';

class AppLightTheme {
  AppLightTheme._();

  static final appTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'AvenirNext',
    primarySwatch: generateMaterialColor(AppColors.blueColor),
    colorScheme: const ColorScheme.light(
      primary: AppColors.blueColor,
      onPrimary: Colors.white,
      primaryContainer: Colors.white,
      onPrimaryContainer: AppColors.blackColor,
      secondaryContainer: AppColors.lightGreyColor,
      onSecondaryContainer: AppColors.blackColor,
      error: AppColors.redColor,
      onError: Colors.white,
    ),
    hintColor: AppColors.darkerGreyColor,
    errorColor: AppColors.redColor,
    highlightColor: AppColors.blueColor,
    scaffoldBackgroundColor: AppColors.blueColor,
    backgroundColor: AppColors.whiteColor,
    toggleableActiveColor: AppColors.blueColor,
    dialogBackgroundColor: AppColors.blueColor,
    dividerColor: AppColors.darkerGreyColor,
    disabledColor: AppColors.greyColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          AppColors.whiteColor,
        ),
      ),
    ),
    inputDecorationTheme: _inputDecorationTheme
  );

  static final ThemeData theme = ThemeData(
      appBarTheme: _appBarTheme,
      brightness: Brightness.light,
      primarySwatch: generateMaterialColor(AppColors.blueColor),
      backgroundColor: Colors.white,
      fontFamily: 'Avenir',
      textTheme: _textTheme,
      scaffoldBackgroundColor: AppColors.blueColor,
      inputDecorationTheme: _inputDecorationTheme,
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

  static final _inputDecorationTheme = InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppDimension.borderRadiusSmall,
      ),
      borderSide: const BorderSide(
        color: AppColors.darkBlueColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppDimension.borderRadiusSmall,
      ),
      borderSide: const BorderSide(
        color: AppColors.greyColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppDimension.borderRadiusSmall,
      ),
      borderSide: const BorderSide(
        color: AppColors.redColor,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppDimension.borderRadiusSmall,
      ),
      borderSide: const BorderSide(
        color: AppColors.amberColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppDimension.borderRadiusSmall,
      ),
      borderSide: const BorderSide(
        color: AppColors.redColor,
      ),
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        AppColors.blueColor,
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

  static const LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}
