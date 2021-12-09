import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ProductCommentRating extends StatelessWidget {
  final double? rating;

  const ProductCommentRating({Key? key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall / 2),
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Padding(
              padding:
                  const EdgeInsets.only(right: AppDimensions.paddingSmall / 2),
              child: Icon(
                i < rating!.floor()
                    ? CupertinoIcons.star_fill
                    : CupertinoIcons.star,
                color: AppColors.amberColor,
                size: 16.0,
              ),
            ),
          Text(rating.toString()),
        ],
      ),
    );
  }
}
