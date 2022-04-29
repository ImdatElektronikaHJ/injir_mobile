import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitRegistrationTitleWidget extends StatelessWidget {
  const InitRegistrationTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppDimension.paddingOverLarge,
        ),
        Text(
          'create_account'.tr,
          style: AppTextStyle.avenirBold
              .copyWith(fontSize: AppDimension.fontSizeOverLarge),
        ),
      ],
    );
  }
}
