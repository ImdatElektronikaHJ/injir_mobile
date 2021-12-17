import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';

import 'local_widgets/compare_categories_app_bar.dart';
import 'local_widgets/compare_categories_list_item.dart';

class CompareCategoriesScreen extends StatelessWidget {
  const CompareCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CompareAppBar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, pos) => CompareListItem(
              title: 'Phone',
              count: '10',
              onItemTapped: _onItemTapped,
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }

  _onItemTapped() {
    Get.toNamed(AppRoutes.compareRoute, id: NestedNavigationIds.compare);
  }
}
