import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/product_review_stars.dart';

class ProductReview extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function() onRatingTapped;
  final void Function() onPostCommentTapped;
  final int currentRating;
  final String? Function() validateComment;
  final TextEditingController textController;
  const ProductReview(
      {Key? key,
      required this.formKey,
      required this.onRatingTapped,
      required this.onPostCommentTapped,
      this.currentRating = -1,
      required this.validateComment,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimension.paddingMedium),
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
            padding: const EdgeInsets.all(AppDimension.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimension.paddingSmall / 2),
                  child: Text(
                    'rate_product'.tr,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimension.paddingSmall / 2),
                  child: ProductReviewStars(
                    rating: currentRating,
                    onRatingTapped: () {
                      onRatingTapped();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingSmall / 2,
                      vertical: AppDimension.paddingMedium),
                  child: Text(
                    'your_comments'.tr,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimension.paddingSmall / 2,
                  ),
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: textController,
                      maxLines: 10,
                      validator: (_) => validateComment(),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimension.borderRadiusMedium,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppDimension.borderRadiusMedium,
                          ),
                          borderSide: const BorderSide(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    AppDimension.paddingSmall / 2,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        AppDimension.paddingExtraLarge * 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimension.borderRadiusSmall),
                      ),
                    ),
                    onPressed: () {
                      onPostCommentTapped();
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
