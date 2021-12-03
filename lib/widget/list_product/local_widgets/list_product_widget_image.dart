
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';
import 'package:tajir/widget/animated_like_button.dart';

class ListProductImageBlock extends StatelessWidget {
  final String imageUrl;
  final Function(bool) onFavouriteTapped;
  final String? salePercentage;

  const ListProductImageBlock(
      {Key? key,
      required this.imageUrl,
      required this.onFavouriteTapped,
      this.salePercentage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingSmall),
          child: Center(
            child: Image.asset(imageUrl),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: AnimatedLikeButton(
              isInWishList: true, onFavoriteTapped: onFavouriteTapped),
        ),
        Visibility(
          visible: salePercentage != null && salePercentage?.isNotEmpty == true,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingSmall),
              decoration: BoxDecoration(
                color: AppColors.redColor,
                borderRadius:
                    BorderRadius.circular(AppDimensions.borderRadiusSmall / 2),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingSmall / 1.5,
                  vertical: AppDimensions.paddingSmall / 3),
              child: Text(
                '-$salePercentage%',
                maxLines: 1,
                style: Theme.of(context).textTheme.button!.copyWith(
                    color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



