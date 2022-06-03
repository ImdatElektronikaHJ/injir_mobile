import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class LoginWelcomeTitleWidget extends StatelessWidget {
  const LoginWelcomeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppDimension.paddingOverLarge,
        ),
        Text(
          'tajir_sign_in'.tr,
          style: AppTextStyle.avenirBold
              .copyWith(fontSize: AppDimension.fontSizeOverLarge),
        ),
        const SizedBox(
          height: AppDimension.paddingOverLarge,
        ),
      ],
    );
  }
}
