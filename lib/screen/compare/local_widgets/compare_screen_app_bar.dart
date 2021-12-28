import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';

class CompareScreenAppBar extends StatelessWidget {
  const CompareScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(
        color: AppColors.darkBlueColor,
      ),
      title: Text(
        'compare'.tr,
        style: Theme.of(context).textTheme.headline6,
      ),
      backgroundColor: AppColors.whiteColor,
      floating: true,
    );
  }
}
