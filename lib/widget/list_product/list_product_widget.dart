import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

import 'package:tajir/const/nested_navigation_ids.dart';

import 'local_widgets/list_product_widget_image.dart';
import 'local_widgets/list_product_widget_price.dart';
import '../rating_widget.dart';
import 'local_widgets/list_product_widget_title.dart';

class ListProductWidget extends StatelessWidget {
  const ListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productRoute, id: NestedNavigationIds.home);
      },
      child: Container(
        height: AppDimensions.listProductHeight + AppDimensions.marginLarge,
        width: AppDimensions.listProductWidth + AppDimensions.marginMedium,
        margin: const EdgeInsets.symmetric(
            horizontal: AppDimensions.marginMedium / 2,
            vertical: AppDimensions.marginMedium),
        padding: const EdgeInsets.only(bottom: AppDimensions.paddingSmall),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackColor6,
              blurRadius: 19,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
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
                  salePercentage: '16',
                )),
            const Center(
              child: RatingWidget(
                rating: 1.6,
              ),
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
      ),
    );
  }
}
