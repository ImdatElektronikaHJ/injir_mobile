import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CompareSpecificationValueBackgroundStyle extends StatelessWidget {
  final Widget child;

  const CompareSpecificationValueBackgroundStyle(
      {Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.compareSpecificationHeight,
      decoration: BoxDecoration(
        color: AppColors.lightBlueGreyColor,
        borderRadius: BorderRadius.circular(
          AppDimension.borderRadiusMicro,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: AppDimension.paddingSmall,
      ),
      child: child,
    );
  }
}
