import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/screen/category/category_screen.dart';

class CustomNavigator extends StatelessWidget {
  final Widget initialRoute;
  final int nestedId;

  const CustomNavigator(
      {required this.initialRoute, required this.nestedId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(nestedId),
      onGenerateRoute: _routes(initialRoute),
    );
  }

  RouteFactory _routes(Widget initialRoute) {
    return (settings) {
      final Map<String, dynamic>? arguments =
          settings.arguments as Map<String, dynamic>?;
      Widget screen;
      switch (settings.name) {
        case AppRoutes.defaultRoute:
          screen = initialRoute;
          break;

        case AppRoutes.categoryRoute:
          screen = const CategoryScreen();
          break;

        default:
          return null;
      }
      return GetPageRoute(routeName: settings.name, page: () => screen);
    };
  }
}
