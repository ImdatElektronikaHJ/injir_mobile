import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

import 'local_widgets/product_review_stars.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'leave_feedback'.tr,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.paddingSmall / 2),
                  child: Text(
                    'rate_product'.tr,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingSmall / 2),
                  child: ProductReviewStars(rating: 2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingSmall / 2,
                      vertical: AppDimensions.paddingMedium),
                  child: Text(
                    'your_comments'.tr,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingSmall / 2,
                  ),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.borderRadiusMedium,
                        ),
                        borderSide: const BorderSide(
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.borderRadiusMedium,
                        ),
                        borderSide: const BorderSide(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    AppDimensions.paddingSmall / 2,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          AppDimensions.paddingExtraLarge * 2,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.borderRadiusSmall))),
                    onPressed: () {
                      print('dasdasdasdasd');
                    },
                    child: Text('comment'.tr),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
