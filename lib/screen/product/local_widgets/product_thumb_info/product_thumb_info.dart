import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/rating_widget.dart';

import 'local_widgets/product_price.dart';

class ProductThumbInfo extends StatelessWidget {
  final bool? inStock;
  const ProductThumbInfo({Key? key, this.inStock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Смартфон Samsung Galaxy Note 10+ 12/256GB White(SM-N975FZWDSER)',
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
                const Expanded(
                  child: ProductPrice(
                    price: 1200,
                    salePrice: 1250,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    inStock! ? 'in_stock'.tr : 'out_of_stock'.tr,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: inStock!
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
