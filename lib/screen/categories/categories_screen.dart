import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';


import 'local_widgets/categories_app_bar.dart';
import 'local_widgets/categories_screen_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CategoriesAppBar(),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.2,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return CategoriesScreenItem( onCategoryTapped: _goToCategoryScreen,);
          },childCount: 8),
        ),
      ],
    );
  }

  _goToCategoryScreen() {
    Get.toNamed(AppRoutes.categoryRoute, id: NestedNavigationIds.categories);
  }
}
