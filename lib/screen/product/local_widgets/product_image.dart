import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/model/slide_banner.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/animated_like_button.dart';
import 'package:tajir/widget/slide_banner_widget.dart';

class ProductImage extends StatelessWidget {
  final bool? isInWishlist;
  final Function(bool)? onFavouriteTapped;
  final Function onBackTapped;
  const ProductImage(
      {Key? key,
      this.isInWishlist,
      this.onFavouriteTapped,
      required this.onBackTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.productSliderBannerHeight,
      child: Stack(
        children: [
          SlideBannerWidget(
            activeColor: AppColors.darkBlueColor,
            disabledColor: AppColors.darkBlueColor30,
            slideBanners: [
              //TODO: add logic for banners on product screen
              SlideBanner(image: ''),
              SlideBanner(image: ''),
              SlideBanner(image: ''),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: AnimatedLikeButton(
              isInWishList: isInWishlist!,
              onFavoriteTapped: (bool isInWishlist) =>
                  onFavouriteTapped!(isInWishlist),
            ),
          ),
          GestureDetector(
            onTap: () => onBackTapped(),
            child: Container(
              padding: const EdgeInsets.all(AppDimension.paddingSmall),
              color: AppColors.whiteColor,
              child: Icon(
                Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
                color: AppColors.darkBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
