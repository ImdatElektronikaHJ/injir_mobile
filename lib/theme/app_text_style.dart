import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class AppTextStyle {
  AppTextStyle._();

  static final avenirLight = TextStyle(
    fontFamily: 'AvenirNext',
    fontWeight: FontWeight.w300,
    fontSize: AppDimension.fontSizeDefault,
  );

  static final avenirBold = TextStyle(
    fontFamily: 'AvenirNext',
    fontWeight: FontWeight.w700,
    fontSize: AppDimension.fontSizeDefault,
  );

  static final avenirRegular = TextStyle(
    fontFamily: 'AvenirNext',
    fontWeight: FontWeight.w400,
    fontSize: AppDimension.fontSizeDefault,
  );
}
