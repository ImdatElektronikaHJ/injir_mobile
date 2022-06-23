import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/cart_controller.dart';
import 'package:tajir/controller/product_controller.dart';
import 'package:tajir/controller/wishlist_controller.dart';
import 'package:tajir/model/product.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/featured_block/featured_block.dart';
import 'package:tajir/widget/list_list_product_widget.dart';

import 'local_widgets/product_buttons/product_buttons.dart';
import 'local_widgets/product_comments/product_comments.dart';
import 'local_widgets/product_description.dart';
import 'local_widgets/product_expansion_description.dart';
import 'local_widgets/product_image.dart';
import 'local_widgets/product_review/product_review.dart';
import 'local_widgets/product_short_infos/product_short_infos.dart';
import 'local_widgets/product_specifications/product_spetifications.dart';
import 'local_widgets/product_thumb_info/product_thumb_info.dart';

const productId = 'product_id';

class ProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final int currentId;
  ProductScreen({Key? key, required this.currentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(currentId: currentId, formKey: _formKey),
      global: false,
      builder: (controller) {
        Status status = controller.productResponse.status;
        Product product = controller.productResponse.data ?? Product.dummy();
        return Container(
          color: Get.theme.backgroundColor,
          child: CustomScrollView(
            slivers: [
              SliverVisibility(
                visible: status == Status.loading,
                sliver: const SliverFillRemaining(
                  hasScrollBody: false,
                  child: SizedBox(
                    height: AppDimension.loaderSizeSmall,
                    width: AppDimension.loaderSizeSmall,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ),
              SliverVisibility(
                visible: status == Status.completed,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<WishlistController>(
                        builder: (wishlistController) => ProductImage(
                          isInWishlist:
                              wishlistController.isInWishlist(product.id),
                          onFavouriteTapped: () {
                            if (wishlistController.isInWishlist(product.id)) {
                              wishlistController.removeProduct(product.id);
                            } else {
                              wishlistController.addProduct(
                                  productId: product.id,
                                  thumb: product.thumb,
                                  name: product.name,
                                  model: product.model,
                                  quantity: product.quantity,
                                  price: product.price,
                                  special: product.special);
                            }
                          },
                          onBackTapped: () => _onBackTapped(context),
                          imageUrls: [product.image ?? '', ...product.images],
                        ),
                      ),
                      ProductThumbInfo(
                        product: product,
                      ),
                      ProductShortInfos(
                        product: product,
                      ),
                      GetBuilder<CartController>(
                        builder: (cartController) => ProductButtons(
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
                                inStock: product.quantity! > 0,
                                price: product.price,
                                type: product.type,
                                categories: product.categories,
                                salePrice: product.special);
                          },
                          // count: product.quantity,
                          cartProductQuantity:
                              cartController.cart.data != null &&
                                      cartController.cart.data
                                              ?.products?[product.id] !=
                                          null
                                  ? cartController.cart.data
                                      ?.products![product.id]!.quantity
                                  : 0,
                        ),
                      ),
                      ProductExpansionDescription(
                        title: 'description'.tr,
                        child: ProductDescription(
                          description:
                              product.description ?? 'no_description'.tr,
                        ),
                      ),
                      //TODO: connect with api (no api right now)
                      ProductExpansionDescription(
                        title: 'specifications'.tr,
                        child: const ProductSpecifications(),
                      ),
                      //TODO: connect with api (no api right now)
                      ProductExpansionDescription(
                        title: 'reviews'.tr,
                        child: const ProductComments(),
                      ),
                      ProductReview(
                        formKey: _formKey,
                        currentRating: controller.currentRating,
                        onRatingTapped: () {
                          controller.onRatingTapped();
                        },
                        onCommentChanged: (value) {
                          controller.onCommentChanged(value);
                        },
                        validateComment: () => controller.validateComment(),
                        onPostCommentTapped: () {
                          controller.onPostCommentTapped();
                        },
                      ),
                      Visibility(
                        visible: controller.relatedProducts.status ==
                                Status.completed &&
                            controller.relatedProducts.data != null &&
                            controller.relatedProducts.data!.isNotEmpty,
                        child: FeaturedBlockWidget(
                          title: 'related_products'.tr,
                          childWidget: ListListProductWidget(
                            productList: controller.relatedProducts.data,
                          ),
                          onSeeAllTapped: _onSeeAllTapped,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onSeeAllTapped() {
    print('on see all');
  }

  _onBackTapped(BuildContext context) {
    Navigator.of(context).pop();
  }
}
