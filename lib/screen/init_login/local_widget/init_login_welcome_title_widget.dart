import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitLoginWelcomeTitleWidget extends StatelessWidget {
  const InitLoginWelcomeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppDimension.paddingOverLarge,
        ),
        Text(
          'tajir_welcome'.tr,
          style: AppTextStyle.avenirBold
              .copyWith(fontSize: AppDimension.fontSizeOverLarge),
        ),
        const SizedBox(
          height: AppDimension.paddingOverLarge,
        ),
        Text(
          'fill_email_password_login'.tr,
          style: AppTextStyle.avenirRegular
              .copyWith(fontSize: AppDimension.fontSizeLarge),
        )
      ],
    );
  }
}