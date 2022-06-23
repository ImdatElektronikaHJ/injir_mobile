import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/model/wishlist_product.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/caching_image.dart';
import 'package:tajir/widget/rating_widget.dart';
import 'package:tajir/widget/sale_widget.dart';

import '../../../controller/cart_controller.dart';
import '../../../widget/add_to_cart_widget/add_to_cart_widget.dart';

class WishlistProductItem extends StatelessWidget {
  final bool isShadowVisible;
  final WishlistProduct product;
  final void Function() onRemoveTapped;
  final void Function() onProductTapped;
  const WishlistProductItem(
      {Key? key,
      this.isShadowVisible = true,
      required this.product,
      required this.onRemoveTapped,
      required this.onProductTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onProductTapped();
      },
      child: Container(
        height: AppDimension.wishlistProductHeight,
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
            : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Padding(
                padding: const EdgeInsets.all(AppDimension.paddingMedium),
                child: CachingImage(product.thumb),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${product.name}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16.0),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          onRemoveTapped();
                        },
                        padding: const EdgeInsets.all(AppDimension.marginSmall),
                        icon: const Icon(Icons.favorite,
                            color: AppColors.redColor),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: product.salePrice != null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${product.salePrice ?? 1} TMT',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: AppColors.darkBlueColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${product.price} TMT',
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
                        visible: product.salePrice == null,
                        child: Text(
                          '${product.price} TMT',
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
                          visible: product.salePrice != null,
                          child: SaleWidget(
                              salePercentage: (100 -
                                      ((product.price ?? 1) /
                                          (product.salePrice ?? 1) *
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
                      //TODO: no quantity in api
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.paddingSmall),
                        child: Text(
                          'in_stock'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: AppColors.blueColor),
                        ),
                      ),
                    ],
                  ),
                  GetBuilder<CartController>(
                    builder: (cartController) => Container(
                      alignment: Alignment.topLeft,
                      // width: 35.0,
                      child: AddToCartWidget(
                        onDecrementTapped: () {
                          cartController.decrementTapped(product.id);
                        },
                        onIncrementTapped: () {
                          cartController.incrementTapped(product.id);
                        },
                        onAddToCartTapped: () {
                          cartController.addProduct(
                            productId: product.id,
                            thumb: product.thumb,
                            name: product.name,
                            model: product.model,
                            inStock: true,
                            price: product.price,
                            type: product.type,
                            categories: product.categories,
                            salePrice: null,
                          );
                        },
                        // count: product.quantity,
                        count: cartController.cart.data != null &&
                                cartController
                                        .cart.data?.products?[product.id] !=
                                    null
                            ? cartController
                                .cart.data?.products![product.id]!.quantity
                            : 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
