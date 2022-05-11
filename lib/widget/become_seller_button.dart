import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class BecomeSellerButton extends StatelessWidget {
  final Function()? onActionTapped;
  final ButtonStyle? buttonStyle;
  const BecomeSellerButton({Key? key, this.onActionTapped, this.buttonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.size.shortestSide;
    return Container(
      width: screenWidth * 3 / 5,
      padding:
          const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall / 2),
      child: ElevatedButton(
        style: AppButtonStyle.elevatedButtonStyleSmall,
        onPressed: onActionTapped,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.people),
            Flexible(
              child: Text(
                'become_seller'.tr.toUpperCase(),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
