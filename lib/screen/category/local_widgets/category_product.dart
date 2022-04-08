import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/product_counter/product_counter_widget.dart';
import 'package:tajir/widget/rating_widget.dart';
import 'package:tajir/widget/sale_widget.dart';

class CategoryProdcut extends StatelessWidget {
  final bool isShadowVisible;
  const CategoryProdcut({Key? key, this.isShadowVisible = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppDimension.paddingMedium),
      decoration: isShadowVisible
          ? BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.blackColor6,
                  blurRadius: 19,
                  offset: Offset(0, 2),
                ),
              ],
            )
          : null,
      height: 200.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimension.paddingMedium),
            child: Image.asset('assets/images/placeholder/samsung.png'),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                    child: Text(
                      'Samsung Galaxy Note 10 8/256GB Aura Black',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16.0),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimension.paddingMedium),
                    child: Icon(Icons.favorite, color: AppColors.redColor),
                  ),
                ]),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '1259 TMT',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: AppColors.darkBlueColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '1500 TMT',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: AppDimension.paddingMedium,
                    ),
                    const SaleWidget(salePercentage: '32'),
                    const Expanded(child: SizedBox()),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppDimension.paddingMedium),
                      child: Icon(Icons.compare_arrows,
                          color: AppColors.blueColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const RatingWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimension.paddingSmall),
                      child: Text(
                        'В наличии',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: AppColors.blueColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('to_cart'.tr),
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
