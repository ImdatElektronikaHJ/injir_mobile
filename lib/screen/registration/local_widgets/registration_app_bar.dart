import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';

class RegistrationAppBar extends StatelessWidget {
  const RegistrationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      floating: true,
      backgroundColor: AppColors.whiteColor,
      elevation: 1.0,
      title: Text(
        'create_account'.tr,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
