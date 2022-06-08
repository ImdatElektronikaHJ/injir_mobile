import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/model/product.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/rating_widget.dart';

import 'local_widgets/product_price.dart';

class ProductThumbInfo extends StatelessWidget {
  final Product product;
  const ProductThumbInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name!,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppDimension.marginSmall / 2),
            child: RatingWidget(
              iconSize: 18.0,
              rateTotal: 123,
              rating: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimension.marginSmall / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ProductPrice(
                    price: product.price ?? 0.0,
                    salePrice: product.special,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    product.quantity! > 0 ? 'in_stock'.tr : 'out_of_stock'.tr,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: product.quantity! > 0
                            ? AppColors.darkBlueColor
                            : AppColors.redColor,
                        fontWeight: FontWeight.bold),
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
