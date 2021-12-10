import 'package:flutter/material.dart';
import 'package:tajir/screen/dashboard/local_widgets/dashboard_bottom_nav_item.dart';

class DashboardBottomNavBar extends StatelessWidget {
  final List<DashboardBottomNavItem> items;
  const DashboardBottomNavBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Material(
        elevation: 10.0,
        color: Theme.of(context).bottomAppBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List<Widget>.from(items),
        ),
      ),
    );
  }
}
