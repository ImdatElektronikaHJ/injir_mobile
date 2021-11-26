import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: const Text('Categories screen'),
        onTap: _goToCategoryScreen,
      ),
    );
  }

  _goToCategoryScreen() {
    Get.toNamed(AppRoutes.categoryRoute, id: NestedNavigationIds.categories);
  }
}
