import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class ShowcaseActionButton extends StatelessWidget {
  final Widget child;
  final Function()? onActionTapped;
  const ShowcaseActionButton(
      {Key? key, required this.child, this.onActionTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.size.shortestSide;
    return Container(
      width: screenWidth * 3 / 5,
      padding:
          const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall / 2),
      child: ElevatedButton(
        onPressed: onActionTapped,
        child: child,
        style: AppButtonStyle.elevatedButtonStyleSmall,
      ),
    );
  }
}
