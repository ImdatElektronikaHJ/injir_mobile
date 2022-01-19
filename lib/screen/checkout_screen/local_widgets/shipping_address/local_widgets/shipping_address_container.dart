import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ShippingAddressContainer extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const ShippingAddressContainer(
      {Key? key, required this.child, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal:
                  AppDimension.marginLarge + AppDimension.marginExtraLarge,
              vertical: AppDimension.marginMedium / 2),
          padding: const EdgeInsets.all(AppDimension.paddingMedium),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppDimension.borderRadiusMicro),
            boxShadow: const [
              BoxShadow(
                color: AppColors.blackColor10,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: child),
    );
  }
}
