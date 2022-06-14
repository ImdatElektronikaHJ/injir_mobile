import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/model/cart_product.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/caching_image.dart';
import 'package:tajir/widget/product_counter/product_counter_widget.dart';
import 'package:tajir/widget/rating_widget.dart';

import '../../../widget/sale_widget.dart';

class CartProductItem extends StatelessWidget {
  final bool isShadowVisible;
  final CartProduct? cartProduct;
  final void Function() onIncrementTapped;
  final void Function() onDecrementTapped;
  final void Function()? onProductTapped;
  final void Function() onDeleteTapped;
  const CartProductItem(
      {Key? key,
      this.isShadowVisible = true,
      required this.cartProduct,
      required this.onIncrementTapped,
      required this.onDecrementTapped,
      this.onProductTapped,
      required this.onDeleteTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onProductTapped!();
      },
      child: Container(
        height: 200.0,
        padding:
            const EdgeInsets.symmetric(vertical: AppDimension.paddingMedium),
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
            : BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppDimension.paddingMedium),
                child: CachingImage(cartProduct?.thumb),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${cartProduct?.name}',
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
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: cartProduct?.salePrice != null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${cartProduct?.salePrice ?? 1} TMT',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: AppColors.darkBlueColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${cartProduct?.price} TMT',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 13.0,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cartProduct?.salePrice == null,
                        child: Text(
                          '${cartProduct?.price} TMT',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: AppColors.darkBlueColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: AppDimension.paddingMedium,
                      ),
                      Visibility(
                          visible: cartProduct?.salePrice != null,
                          child: SaleWidget(
                              salePercentage: (100 -
                                      ((cartProduct?.price ?? 1) /
                                          (cartProduct?.salePrice ?? 1) *
                                          100))
                                  .toStringAsFixed(2))),
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
                        child: cartProduct!.inStock!
                            ? Text(
                                'in_stock'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(color: AppColors.blueColor),
                              )
                            : Text(
                                'out_of_stock'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(color: AppColors.blueColor),
                              ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170.0,
                        child: ProductCounterWidget(
                          onDecrementTapped: () {
                            onDecrementTapped();
                          },
                          onIncrementTapped: () {
                            onIncrementTapped();
                          },
                          count: cartProduct?.quantity,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          onDeleteTapped();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.darkerGreyColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
