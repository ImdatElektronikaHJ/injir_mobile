import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/dashboard_controller.dart';
import 'package:tajir/screen/cart/cart_screen.dart';
import 'package:tajir/screen/categories/categories_screen.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_bottom_nav.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_container.dart';
import 'package:tajir/screen/home/home_screen.dart';
import 'package:tajir/screen/profile/profile_screen.dart';
import 'package:tajir/screen/stores/stores_screen.dart';
import 'package:tajir/theme/app_dimensions.dart';
import 'package:tajir/widget/custom_navigator.dart';
import 'package:tajir/widget/fade_indexed_stack.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: AppDimensions.appBarLeadingWidth,
        automaticallyImplyLeading: false,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingSmall),
            child: Image.asset(
              'assets/images/tajir_logo_text.png',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              CupertinoIcons.heart_fill,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              CupertinoIcons.arrow_right_arrow_left,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              CupertinoIcons.person_2_fill,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: AppDimensions.paddingMedium,
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: _dashboardController.onWillPop,
        child: DashboardContainer(
          child: Obx(() {
            return FadeIndexedStack(
                index: _dashboardController.currentIndex.value,
                children: const [
                  CustomNavigator(
                      initialRoute: HomeScreen(),
                      nestedId: NestedNavigationIds.home),
                  CustomNavigator(
                      initialRoute: CategoriesScreen(),
                      nestedId: NestedNavigationIds.categories),
                  CustomNavigator(
                      initialRoute: CartScreen(),
                      nestedId: NestedNavigationIds.cart),
                  CustomNavigator(
                      initialRoute: StoresScreen(),
                      nestedId: NestedNavigationIds.stores),
                  CustomNavigator(
                      initialRoute: ProfileScreen(),
                      nestedId: NestedNavigationIds.profile),
                ]);
          }),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return DashboardBottomNav(
            onItemSelected: (pos) {
              _dashboardController.updateCurrentIndex(pos);
            },
            currentIndex: _dashboardController.currentIndex.value);
      }),
    );
  }
}
