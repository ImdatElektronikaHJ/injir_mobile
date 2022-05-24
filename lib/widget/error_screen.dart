import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';

import '../theme/app_dimension.dart';

class ErrorScreen extends StatelessWidget {
  final void Function() onRetryTapped;
  const ErrorScreen({Key? key, required this.onRetryTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/error.png'),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimension.paddingSmall),
            child: Text(
              'No network connection'.toUpperCase(),
              style: Get.theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: AppDimension.marginSmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimension.paddingSmall),
            child: Text(
              'Original with 1000 product from a lot of  different brand accros the world. buy so easy with just simple step then your item will send it.',
              style: Get.theme.textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: AppDimension.marginLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
            child: ElevatedButton(
              onPressed: onRetryTapped,
              child: Text('retry'.tr),
              style: AppButtonStyle.elevatedButtonStyleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
