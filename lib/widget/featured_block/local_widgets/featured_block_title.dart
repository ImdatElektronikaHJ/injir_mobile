import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class FeaturedBlockTitle extends StatelessWidget {
  final String? title;
  final Function? onSeeAllTapped;

  const FeaturedBlockTitle({Key? key, this.title, this.onSeeAllTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimensions.marginMedium),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () => onSeeAllTapped!(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingSmall,
                  vertical: AppDimensions.paddingSmall / 2),
              color: Colors.transparent,
              child: Text(
                'see_all'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: AppColors.darkBlueColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
