import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/model/list_product.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

import '../rating_widget.dart';
import 'local_widgets/list_product_widget_image.dart';
import 'local_widgets/list_product_widget_price.dart';
import 'local_widgets/list_product_widget_title.dart';

class ListProductWidget extends StatelessWidget {
  final ListProduct? listProduct;
  const ListProductWidget({Key? key, this.listProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productRoute, id: NestedNavigationIds.home);
      },
      child: Container(
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
                  onFavouriteTapped: () {
                    // print();
                  },
                  salePercentage: '16',
                )),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(AppDimension.paddingSmall / 3),
                child: RatingWidget(
                  rating: 1.6,
                ),
              ),
            ),
            ListProductTitleBlock(
              title: listProduct?.name ?? '',
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
