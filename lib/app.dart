import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tajir/localization/localization_service.dart';
import 'package:tajir/screen/main/main_screen.dart';
import 'package:tajir/theme/app_dark_theme.dart';
import 'package:tajir/theme/app_light_theme.dart';
import 'package:tajir/theme/app_theme_service.dart';

class TajirApp extends StatelessWidget {
  final LocalizationService localizationService = LocalizationService();
  TajirApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: LocalizationService.localizationsDelegate(),
      locale: localizationService.getLocale(),
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: localizationService,
      title: 'Tajir',
      theme: AppLightTheme.theme,
      darkTheme: AppDarkTheme.theme,
      themeMode: AppThemeService().themeMode,
      home: MainScreen(),
    );
  }
}
