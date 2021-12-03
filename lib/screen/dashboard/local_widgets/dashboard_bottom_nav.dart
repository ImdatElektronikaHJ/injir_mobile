import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/dashboard/consts/dashboard_navigation_index.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_bottom_nav_bar.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_bottom_nav_item.dart';

class DashboardBottomNav extends StatelessWidget {
  final Function(int)? onItemSelected;
  final int currentIndex;
  const DashboardBottomNav(
      {Key? key, this.onItemSelected, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardBottomNavBar(items: [
      DashboardBottomNavItem(
        value: DashboardNavigationIndex.home,
        groupValue: currentIndex,
        iconData: CupertinoIcons.house,
        tooltip: 'home'.tr,
        onTapped: () => _onItemTapped(DashboardNavigationIndex.home),
      ),
      DashboardBottomNavItem(
        value: DashboardNavigationIndex.categories,
        groupValue: currentIndex,
        iconData: CupertinoIcons.square_grid_2x2,
        tooltip: 'categories'.tr,
        onTapped: () => _onItemTapped(DashboardNavigationIndex.categories),
      ),
      DashboardBottomNavItem(
        value: DashboardNavigationIndex.cart,
        groupValue: currentIndex,
        iconData: CupertinoIcons.bag,
        tooltip: 'cart'.tr,
        onTapped: () => _onItemTapped(DashboardNavigationIndex.cart),
      ),
      DashboardBottomNavItem(
        value: DashboardNavigationIndex.stores,
        groupValue: currentIndex,
        iconData: CupertinoIcons.house_alt,
        tooltip: 'stores'.tr,
        onTapped: () => _onItemTapped(DashboardNavigationIndex.stores),
      ),
      DashboardBottomNavItem(
        value: DashboardNavigationIndex.profile,
        groupValue: currentIndex,
        iconData: CupertinoIcons.person,
        tooltip: 'profile'.tr,
        onTapped: () => _onItemTapped(DashboardNavigationIndex.profile),
      ),
    ]);
  }

  _onItemTapped(int index) {
    onItemSelected!(index);
  }
}
