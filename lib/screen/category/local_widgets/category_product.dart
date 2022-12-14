import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/controller/cart_controller.dart';
import 'package:tajir/model/list_product.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/add_to_cart_widget/add_to_cart_widget.dart';
import 'package:tajir/widget/animated_like_button.dart';
import 'package:tajir/widget/caching_image.dart';
import 'package:tajir/widget/rating_widget.dart';
import 'package:tajir/widget/sale_widget.dart';

import '../../../controller/wishlist_controller.dart';

class CategoryProduct extends StatelessWidget {
  final bool isShadowVisible;
  final ListProduct listProduct;
  final void Function() onProductTapped;
  const CategoryProduct(
      {Key? key,
      this.isShadowVisible = true,
      required this.listProduct,
      required this.onProductTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onProductTapped();
      },
      child: Container(
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
        height: 200.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimension.paddingMedium),
              child: SizedBox(
                  // height: 120.0,
                  width: 100.0,
                  child: CachingImage(listProduct.thumb)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      child: Text(
                        listProduct.name!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GetBuilder<WishlistController>(
                        builder: (wishlistController) => AnimatedLikeButton(
                              isInWishList: wishlistController
                                  .isInWishlist(listProduct.id),
                              onFavoriteTapped: () {
                                if (wishlistController
                                    .isInWishlist(listProduct.id)) {
                                  wishlistController
                                      .removeProduct(listProduct.id);
                                } else {
                                  wishlistController.addProduct(
                                      productId: listProduct.id,
                                      thumb: listProduct.thumb,
                                      name: listProduct.name,
                                      model: listProduct.model,
                                      quantity: listProduct.quantity,
                                      price: listProduct.price,
                                      special: listProduct.special);
                                }
                              },
                            )),
                  ]),
                  listProduct.special != null && listProduct.special != 0.0
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${listProduct.special} TMT',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: AppColors.darkBlueColor,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${listProduct.price} TMT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: AppDimension.paddingMedium,
                            ),
                            SaleWidget(
                                salePercentage:
                                    listProduct.getDiscount().toString()),
                            const Expanded(child: SizedBox()),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimension.paddingMedium),
                              child: Icon(Icons.compare_arrows,
                                  color: AppColors.blueColor),
                            ),
                          ],
                        )
                      : Text(
                          '${listProduct.price} TMT',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: AppColors.darkBlueColor,
                                  fontWeight: FontWeight.bold),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RatingWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.paddingSmall),
                        child: Text(
                          listProduct.quantity! > 0
                              ? 'in_stock'.tr
                              : 'out_of_stock'.tr,
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
                          cartController.decrementTapped(listProduct.id);
                        },
                        onIncrementTapped: () {
                          cartController.incrementTapped(listProduct.id);
                        },
                        onAddToCartTapped: () {
                          cartController.addProduct(
                            productId: listProduct.id,
                            thumb: listProduct.thumb,
                            name: listProduct.name,
                            model: listProduct.model,
                            inStock: listProduct.quantity! > 0,
                            price: listProduct.price,
                            type: listProduct.type,
                            categories: listProduct.categories,
                            salePrice: listProduct.special,
                          );
                        },
                        // count: listProduct.quantity,
                        count: cartController.cart.data != null &&
                                cartController
                                        .cart.data?.products?[listProduct.id] !=
                                    null
                            ? cartController
                                .cart.data?.products![listProduct.id]!.quantity
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
