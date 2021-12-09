import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/screen/categories/local_widgets/category_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return CategoryItemWidget( onCategoryTapped: _goToCategoryScreen,);
      },
    );
  }

  _goToCategoryScreen() {
    Get.toNamed(AppRoutes.categoryRoute, id: NestedNavigationIds.categories);
  }
}
