import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DashboardBottomNav extends StatelessWidget {
  final Function(int)? onItemSelected;
  final int currentIndex;
  const DashboardBottomNav(
      {Key? key, this.onItemSelected, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.house), label: 'home'.tr),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.square_grid_2x2),
            label: 'categories'.tr),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.bag), label: 'cart'.tr),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.house_alt), label: 'stores'.tr),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person), label: 'profile'.tr),
      ],
      unselectedFontSize: 0.0,
      selectedFontSize: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: onItemSelected,
      currentIndex: currentIndex,
    );
  }
}
