import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class FeaturedBlockWidget extends StatelessWidget {
  final Widget childWidget;
  final String title;
  const FeaturedBlockWidget({
    Key? key,
    required this.childWidget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.marginMedium),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.marginSmall),
          FeaturedBlockTitle(title: title),
          childWidget,
        ],
      ),
    );
  }
}

class FeaturedBlockTitle extends StatelessWidget {
  final String title;

  const FeaturedBlockTitle({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimensions.marginMedium),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () {
              print('on see all tapped');
              //TODO add click listener
            },
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
