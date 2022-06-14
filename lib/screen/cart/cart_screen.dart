import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/cart_controller.dart';
import 'package:tajir/data/network/helpers/cart_sync_helper.dart';
import 'package:tajir/model/cart.dart';
import 'package:tajir/screen/cart/local_widgets/cart_product_item.dart';
import 'package:tajir/screen/cart/local_widgets/cart_total_bar.dart';
import 'package:tajir/screen/product/product_screen.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/util/interpolation_util.dart';
import 'package:tajir/widget/error_screen.dart';

import 'local_widgets/cart_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      // init: CartController(),
      builder: (controller) {
        Cart? cart = controller.cart.data ?? Cart();
        return Column(
          children: [
            const CartAppBar(),
            Visibility(
              visible: controller.cart.status == Status.completed,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimension.paddingMedium, vertical: AppDimension.paddingSmall),
                              child: Text(
                                InterpolationUtil.interpolate(
                                    "product_count".tr,
                                    [cart.products?.length ?? 0]),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                          SliverVisibility(
                            visible: cart.products == null,
                            sliver: SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: Text('cart_is_empty'.tr),
                              ),
                            ),
                          ),
                          SliverVisibility(
                            visible: cart.products != null,
                            sliver: SliverList(
                              delegate: SliverChildListDelegate(
                                cart.products == null
                                    ? []
                                    : cart.products!.entries
                                        .map(
                                          (entryValue) => SizedBox(
                                            height: 200.0,
                                            width: 200.0,
                                            child: CartProductItem(
                                                onProductTapped: () {
                                                  Get.toNamed(
                                                      AppRoutes.productRoute,
                                                      id: NestedNavigationIds
                                                          .cart,
                                                      arguments: {
                                                        productId:
                                                            entryValue.value.id
                                                      });
                                                },
                                                onIncrementTapped: () {
                                                  controller.incrementTapped(
                                                      entryValue.value.id);
                                                },
                                                onDecrementTapped: () {
                                                  controller.decrementTapped(
                                                      entryValue.value.id);
                                                },
                                                isShadowVisible:
                                                    entryValue.key % 2 == 0,
                                                cartProduct: entryValue.value,
                                                onDeleteTapped: () {
                                                  controller.removeProduct(entryValue.value.id);
                                                }),
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CartTotalBar(
                        total: cart.total.toString(),
                        onCheckoutTapped: () {
                          if (controller.syncStatus != CartSyncStatus.loading &&
                              controller.cart.status != Status.loading) {
                            Get.toNamed(AppRoutes.checkoutRoute,
                                id: NestedNavigationIds.cart);
                          }
                        },
                        isLoading:
                            controller.syncStatus == CartSyncStatus.loading ||
                                controller.cart.status == Status.loading),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: controller.cart.status == Status.loading,
              child: const Expanded(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
            Visibility(
                visible: controller.cart.status == Status.error,
                child: ErrorScreen(
                  onRetryTapped: () {
                    controller.fetchCart();
                  },
                )),
          ],
        );
      },
    );
  }
}
