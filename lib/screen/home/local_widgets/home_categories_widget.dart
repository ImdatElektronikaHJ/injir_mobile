import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: AppDimension.homeCategoriesWidth,
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimension.marginSmall,
              vertical: AppDimension.marginSmall / 2,
            ),
            decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGreyColor.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 20)
                ],
                borderRadius:
                    BorderRadius.circular(AppDimension.borderRadiusMedium)),
          ),
        ),
        Text('Jeans',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 16.0)),
      ],
    );
  }
}
