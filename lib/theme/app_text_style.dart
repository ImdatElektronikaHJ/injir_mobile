import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class AppTextStyle {
  AppTextStyle._();

  static final avenirLight = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.w300,
    fontSize: AppDimension.fontSizeDefault,
  );

  static final avenirBold = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.w700,
    fontSize: AppDimension.fontSizeDefault,
  );

  static final avenirRegular = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.w500,
    fontSize: AppDimension.fontSizeDefault,
  );
}
