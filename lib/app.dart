import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/localization/localization_service.dart';
import 'package:tajir/screen/dashboard/dashboard_screen.dart';
import 'package:tajir/screen/init_login/init_login_screen.dart';
import 'package:tajir/screen/init_registration/init_registration_screen.dart';
import 'package:tajir/screen/registration/registration_screen.dart';
import 'package:tajir/screen/showcase/showcase_screen.dart';
import 'package:tajir/screen/splash/splash_screen.dart';
import 'package:tajir/theme/app_light_theme.dart';
import 'package:tajir/theme/app_theme_service.dart';

import 'const/app_routes.dart';
import 'screen/login/login_screen.dart';

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
        theme: AppLightTheme.appTheme,
        themeMode: AppThemeService().themeMode,
        getPages: [
          GetPage(
            name: AppRoutes.defaultRoute,
            page: () => const SplashScreen(),
            binding: SplashBinding(),
          ),
          GetPage(
            name: AppRoutes.showcaseRoute,
            page: () => const ShowcaseScreen(),
          ),
          GetPage(
            name: AppRoutes.dashboardRoute,
            page: () => DashboardScreen(),
            transition: Transition.fadeIn,
          ),
          GetPage(
            name: AppRoutes.registrationRoute,
            page: () => RegistrationScreen(),
          ),
          GetPage(
            name: AppRoutes.loginRoute,
            page: () => LoginScreen(),
          ),
          GetPage(
            name: AppRoutes.initLoginRoute,
            page: () => InitLoginScreen(),
          ),
          GetPage(
            name: AppRoutes.initRegistrationRoute,
            page: () => InitRegistrationScreen(),
          ),
        ]);
  }
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AccountController(), permanent: true);
  }
}
