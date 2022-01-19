import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CheckoutSummaryDecorationContainer extends StatelessWidget {
  final Widget child;
  const CheckoutSummaryDecorationContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: AppDimension.marginMedium / 2),
      padding: const EdgeInsets.all(AppDimension.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimension.borderRadiusMicro),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 2),
            color: AppColors.blackColor6,
          ),
        ],
      ),
      child: child,
    );
  }
}