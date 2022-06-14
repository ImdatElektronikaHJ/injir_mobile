import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class SaleWidget extends StatelessWidget {
  final String? salePercentage;

  const SaleWidget({Key? key, this.salePercentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimension.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.redColor,
        borderRadius: BorderRadius.circular(AppDimension.borderRadiusSmall / 2),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.paddingSmall / 1.5,
          vertical: AppDimension.paddingSmall / 3),
      child: Text(
        '$salePercentage%',
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
