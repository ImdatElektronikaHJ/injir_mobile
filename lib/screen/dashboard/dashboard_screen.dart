import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/dashboard_controller.dart';
import 'package:tajir/screen/become_seller/become_seller_screen.dart';
import 'package:tajir/screen/cart/cart_screen.dart';
import 'package:tajir/screen/categories/categories_screen.dart';
import 'package:tajir/screen/compare_categories/compare_categories_screen.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_bottom_nav.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_container.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_top_nav_item.dart';
import 'package:tajir/screen/home/home_screen.dart';
import 'package:tajir/screen/profile/profile_screen.dart';
import 'package:tajir/screen/search/search_screen.dart';
import 'package:tajir/screen/stores/stores_screen.dart';
import 'package:tajir/screen/wishlist/wishlist_screen.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/custom_navigator.dart';
import 'package:tajir/widget/fade_indexed_stack.dart';

import 'consts/dashboard_navigation_index.dart';
import 'local_widgets/dashboard_search_bar.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.whiteColor),
      child: Obx(() {
        int currentIndex = _dashboardController.currentIndex;
        bool searchBarExpanded = _dashboardController.searchBarExpanded;
        return ColoredBox(
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Scaffold(
              // resizeToAvoidBottomInset:
              //     false, //TODO: update it later if not ok! This is related to keyboard background color
              appBar: AppBar(
                centerTitle: false,
                leadingWidth: AppDimension.appBarLeadingWidth,
                automaticallyImplyLeading: false,
                elevation: 0.0,
                leading: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimension.paddingSmall),
                    child: Image.asset(
                      'assets/images/tajir_logo_text.png',
                    ),
                  ),
                ),
                actions: [
                  DashboardTopNavItem(
                    value: DashboardNavigationIndex.wishlist,
                    groupValue: currentIndex,
                    iconData: CupertinoIcons.heart_fill,
                    onTapped: () => _dashboardController
                        .updateCurrentIndex(DashboardNavigationIndex.wishlist),
                  ),
                  DashboardTopNavItem(
                    value: DashboardNavigationIndex.compare,
                    groupValue: currentIndex,
                    iconData: CupertinoIcons.arrow_right_arrow_left,
                    onTapped: () => _dashboardController
                        .updateCurrentIndex(DashboardNavigationIndex.compare),
                  ),
                  DashboardTopNavItem(
                    value: DashboardNavigationIndex.search,
                    groupValue: currentIndex,
                    iconData: CupertinoIcons.search,
                    onTapped: () => _dashboardController
                        .updateCurrentIndex(DashboardNavigationIndex.search),
                  ),
                  DashboardTopNavItem(
                    value: DashboardNavigationIndex.becomeSeller,
                    groupValue: currentIndex,
                    iconData: CupertinoIcons.person_2_fill,
                    onTapped: () => _dashboardController.updateCurrentIndex(
                        DashboardNavigationIndex.becomeSeller),
                  ),
                  const SizedBox(
                    width: AppDimension.paddingMedium,
                  )
                ],
              ),
              body: WillPopScope(
                onWillPop: _dashboardController.onWillPop,
                child: Column(
                  children: [
                    DashboardSearchBar(isExpanded: searchBarExpanded),
                    Expanded(
                      child: DashboardContainer(
                        child: FadeIndexedStack(
                            index: currentIndex,
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
                              CustomNavigator(
                                  initialRoute: WishlistScreen(),
                                  nestedId: NestedNavigationIds.wishlist),
                              CustomNavigator(
                                  initialRoute: CompareCategoriesScreen(),
                                  nestedId: NestedNavigationIds.compare),
                              CustomNavigator(
                                initialRoute: SearchScreen(),
                                nestedId: NestedNavigationIds.search,
                              ),
                              CustomNavigator(
                                  initialRoute: BecomeSellerScreen(),
                                  nestedId: NestedNavigationIds.becomeSeller),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: DashboardBottomNav(
                  onItemSelected: (pos) {
                    _dashboardController.updateCurrentIndex(pos);
                  },
                  currentIndex: currentIndex),
            ),
          ),
        );
      }),
    );
  }
}
