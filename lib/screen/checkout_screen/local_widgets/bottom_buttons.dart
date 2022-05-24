import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class BottomButtons extends StatelessWidget {
  final Function onBackTapped;
  final Function onNextTapped;
  final String? title;

  const BottomButtons(
      {Key? key,
      required this.onBackTapped,
      required this.onNextTapped,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.marginLarge + AppDimension.marginExtraLarge,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: AppDimension.paddingMedium),
              child: ElevatedButton(
                style: AppButtonStyle.elevatedButtonStyleMedium.copyWith(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Get.theme.colorScheme.secondaryContainer),
                  elevation: MaterialStateProperty.all<double>(0.0),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Get.theme.colorScheme.onSecondaryContainer),
                ),
                onPressed: () {
                  onBackTapped();
                },
                child: Text(
                  'back'.tr.toUpperCase(),
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: AppButtonStyle.elevatedButtonStyleMedium,
              onPressed: () {
                onNextTapped();
              },
              child: Text(title?.toUpperCase() ?? 'next'.tr.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
