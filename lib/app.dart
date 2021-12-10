import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tajir/localization/localization_service.dart';
import 'package:tajir/screen/dashboard/dashboard_screen.dart';
import 'package:tajir/screen/splash/splash_screen.dart';
import 'package:tajir/theme/app_dark_theme.dart';
import 'package:tajir/theme/app_light_theme.dart';
import 'package:tajir/theme/app_theme_service.dart';

import 'const/app_routes.dart';

class TajirApp extends StatelessWidget {
  final LocalizationService localizationService = LocalizationService();
  TajirApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        localizationsDelegates: LocalizationService.localizationsDelegate(),
        locale: localizationService.getLocale(),
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: localizationService,
        title: 'Tajir',
        theme: AppLightTheme.theme,
        darkTheme: AppDarkTheme.theme,
        themeMode: AppThemeService().themeMode,
        getPages: [
          GetPage(
            name: AppRoutes.defaultRoute,
            page: () => const SplashScreen(),
          ),
          GetPage(
            name: AppRoutes.dashboardRoute,
            page: () => DashboardScreen(),
            transition: Transition.fadeIn,
          ),
        ]);
  }
}
