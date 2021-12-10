import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/animated_like_button.dart';
import 'package:tajir/widget/sale_widget.dart';

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
          padding: const EdgeInsets.only(top: AppDimension.paddingSmall),
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
            child: SaleWidget(
              salePercentage: salePercentage,
            ),
          ),
        ),
      ],
    );
  }
}
