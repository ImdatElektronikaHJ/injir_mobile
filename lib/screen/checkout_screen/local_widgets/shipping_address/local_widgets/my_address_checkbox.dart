import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MyAddressCheckbox extends StatelessWidget {
  final bool isChecked;

  const MyAddressCheckbox({Key? key, required this.isChecked})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('my_address'.tr),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          child: Icon(
            isChecked
                ? CupertinoIcons.largecircle_fill_circle
                : CupertinoIcons.circle,
            key: UniqueKey(),
            color: isChecked ? AppColors.blueColor : AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
