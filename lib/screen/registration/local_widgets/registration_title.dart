import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class RegistrationTitle extends StatelessWidget {
  const RegistrationTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimension.paddingExtraLarge,
            vertical: AppDimension.paddingMedium),
        child: Text(
          'create_account'.tr,
          textAlign: TextAlign.left,
          style: AppTextStyle.avenirBold
              .copyWith(fontSize: AppDimension.fontSizeOverLarge),
        ),
      ),
    );
  }
}
