import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'sign_in'.tr,
        style: Theme.of(context).textTheme.headline6,
      ),
      floating: true,
      iconTheme: const IconThemeData(
        color: AppColors.blackColor,
      ),
      elevation: 1.0,
    );
  }
}
