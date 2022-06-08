import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class ProductReviewStars extends StatelessWidget {
  final int rating;
  final void Function() onRatingTapped;
  // final void Function(int) onRatingChanged;

  const ProductReviewStars(
      {Key? key, required this.rating, required this.onRatingTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () {
              onRatingTapped();
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: i <= rating
                  ? const Icon(
                      CupertinoIcons.star_fill,
                      key: Key('true'),
                      color: AppColors.amberColor,
                    )
                  : const Icon(
                      CupertinoIcons.star_fill,
                      key: Key('false'),
                      color: AppColors.greyColor,
                    ),
            ),
          ),
      ],
    );
  }
}
