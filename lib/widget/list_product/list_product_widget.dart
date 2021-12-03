import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/list_product_widget_image.dart';
import 'local_widgets/list_product_widget_price.dart';
import 'local_widgets/list_product_widget_rating.dart';
import 'local_widgets/list_product_widget_title.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.listProductHeight + AppDimension.marginLarge,
      width: AppDimension.listProductWidth + AppDimension.marginMedium,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimension.marginMedium / 2,
          vertical: AppDimension.marginMedium),
      padding: const EdgeInsets.only(bottom: AppDimension.paddingSmall),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.blackColor6,
            blurRadius: 19,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(AppDimension.borderRadiusSmall),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 3,
              child: ListProductImageBlock(
                imageUrl: 'assets/images/placeholder/samsung.png',
                onFavouriteTapped: (bool isInWishlist) {
                  print(isInWishlist);
                },
                salePercentage: '123',
              )),
          const ListProductRatingBlock(
            rating: 1.6,
          ),
          const ListProductTitleBlock(
            title:
                'Смартфон Samsung Galaxy Note 10+ 12/256GB White(SM-N975FZWDSER)',
          ),
          const ListProductPriceBlock(
            price: '123123',
          ),
        ],
      ),
    );
  }
}
