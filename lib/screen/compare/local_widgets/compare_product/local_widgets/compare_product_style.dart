import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CompareProductStyle extends StatelessWidget {
  final Widget child;

  const CompareProductStyle({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.listProductHeight,
      width: AppDimension.listProductWidth,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimension.marginMedium / 2,
          vertical: AppDimension.marginMedium),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.paddingSmall,
        vertical: AppDimension.paddingSmall,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackColor6,
            blurRadius: 19,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(
          AppDimension.borderRadiusSmall,
        ),
        color: AppColors.whiteColor,
      ),
      child: child,
    );
  }
}
