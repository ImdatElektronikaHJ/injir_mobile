import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';

class SortAppBar extends StatelessWidget {
  const SortAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            iconTheme: const IconThemeData(color: AppColors.blueColor),
            backgroundColor: Theme.of(context).backgroundColor,
            centerTitle: false,
            title: Text('Сортировка'.tr,
                style: Theme.of(context).textTheme.subtitle2!),
            floating: true,
          );
  }
}