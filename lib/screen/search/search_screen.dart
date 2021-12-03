import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: _goToProductScreen,
        child: const Text('Search screen'),
      ),
    );
  }

  _goToProductScreen() {
    // Get.find<DashboardController>().updateVisibilityOfSearchBar(false);
    // Get.toNamed(AppRoutes.productRoute, id: NestedNavigationIds.search);
  }
}
