import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CheckoutSummaryContainer extends StatelessWidget {
  final String title;
  final String bodyText1;
  final String bodyText2;
  const CheckoutSummaryContainer(
      {Key? key,
      required this.title,
      required this.bodyText1,
      required this.bodyText2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimension.paddingSmall / 2),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor.withOpacity(0.9),
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimension.paddingSmall / 2),
          child: Text(
            bodyText1,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.blueColor,
                ),
          ),
        ),
        Text(
          bodyText2,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: AppColors.blueColor,
              ),
        ),
      ],
    );
  }
}
