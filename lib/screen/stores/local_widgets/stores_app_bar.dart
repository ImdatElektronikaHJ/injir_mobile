import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/svg_icons.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class StoresAppBar extends StatelessWidget {
  const StoresAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: false,
      title: Text('stores'.tr, style: Theme.of(context).textTheme.headline6!),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(SvgImages.filter),
        ),
        IconButton(
          onPressed: () {
            _goToFilterScreen();
          },
          icon: SvgPicture.asset(SvgImages.katalog),
        ),
      ],
      floating: true,
    );
  }
  _goToFilterScreen() {
    Get.toNamed(AppRoutes.filterRoute, id: NestedNavigationIds.stores);
  }
}
