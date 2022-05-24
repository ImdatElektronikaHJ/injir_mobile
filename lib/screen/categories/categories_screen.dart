import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/categories_controller.dart';
import 'package:tajir/model/list_category.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/error_screen.dart';

import '../../base/statefull_data.dart';
import 'local_widgets/categories_app_bar.dart';
import 'local_widgets/categories_screen_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      init: CategoriesController(),
      builder: (categoriesController) {
        Status status = categoriesController.categoriesResponse.status;
        return CustomScrollView(
          slivers: [
            const CategoriesAppBar(),
            SliverVisibility(
              visible: status == Status.error,
              sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimension.paddingMedium,
                    horizontal: AppDimension.paddingSmall),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: AppDimension.paddingSmall,
                      crossAxisSpacing: AppDimension.paddingSmall),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return CategoriesScreenItem(
                      onCategoryTapped: _goToCategoryScreen,
                      listCategory: categoriesController
                              .categoriesResponse.data?[index] ??
                          ListCategory.dummy(),
                    );
                  },
                      childCount: categoriesController
                              .categoriesResponse.data?.length ??
                          0),
                ),
              ),
            ),
            SliverVisibility(
              visible: status == Status.loading,
              sliver: const SliverFillRemaining(
                hasScrollBody: false,
                child: CircularProgressIndicator(),
              ),
            ),
            SliverVisibility(
              visible: status == Status.completed,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: ErrorScreen(onRetryTapped: () {}),
              ),
            ),
          ],
        );
      },
    );
  }

  _goToCategoryScreen() {
    Get.toNamed(AppRoutes.categoryRoute, id: NestedNavigationIds.categories);
  }
}
