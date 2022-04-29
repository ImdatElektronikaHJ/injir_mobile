import 'package:flutter/material.dart';
import 'package:tajir/theme/app_text_style.dart';

import 'app_dimension.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static final elevatedButtonStyleLarge = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(AppDimension.paddingExtraLarge),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimension.borderRadiusMedium),
    ),
    textStyle: AppTextStyle.avenirRegular
        .copyWith(fontSize: AppDimension.fontSizeLarge),
  );
  static final elevatedButtonStyleMedium = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(AppDimension.paddingMedium),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimension.borderRadiusMedium),
    ),
    textStyle: AppTextStyle.avenirRegular
        .copyWith(fontSize: AppDimension.fontSizeLarge),
  );

  static final elevatedButtonStyleSmall = ElevatedButton.styleFrom(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.paddingOverLarge,
        vertical: AppDimension.paddingSmall),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimension.borderRadiusSmall),
    ),
    textStyle: AppTextStyle.avenirRegular
        .copyWith(fontSize: AppDimension.fontSizeDefault),
  );
}
