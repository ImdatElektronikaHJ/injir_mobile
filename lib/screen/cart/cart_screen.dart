import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/controller/cart_controller.dart';
import 'package:tajir/data/network/helpers/cart_sync_helper.dart';
import 'package:tajir/model/cart.dart';
import 'package:tajir/screen/cart/local_widgets/cart_total_bar.dart';
import 'package:tajir/widget/error_screen.dart';

import '../../theme/app_dimension.dart';
import '../../util/interpolation_util.dart';
import 'local_widgets/cart_app_bar.dart';
import 'local_widgets/cart_product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        Cart? cart = controller.cart.data ?? Cart();
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const CartAppBar(),
                  SliverVisibility(
                    visible: controller.cart.status == Status.completed,
                    sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.paddingMedium,
                            vertical: AppDimension.paddingSmall),
                        child: Text(
                          InterpolationUtil.interpolate(
                              "product_count".tr, [cart.products?.length ?? 0]),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: controller.cart.status == Status.completed &&
                        cart.products == null,
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text('cart_is_empty'.tr),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: controller.cart.status == Status.completed &&
                        cart.products != null,
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        cart.products == null
                            ? []
                            : cart.products!.entries
                                .map(
                                  (entryValue) => CartProductItem(
                                      onProductTapped: () {
                                        controller.onProductTapped(
                                            entryValue.value.id);
                                      },
                                      onIncrementTapped: () {
                                        controller.incrementTapped(
                                            entryValue.value.id);
                                      },
                                      onDecrementTapped: () {
                                        controller.decrementTapped(
                                            entryValue.value.id);
                                      },
                                      isShadowVisible: entryValue.key % 2 == 0,
                                      cartProduct: entryValue.value,
                                      onDeleteTapped: () {
                                        controller
                                            .removeProduct(entryValue.value.id);
                                      }),
                                )
                                .toList(),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: controller.cart.status == Status.loading,
                    sliver: const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                  SliverVisibility(
                    visible: controller.cart.status == Status.error,
                    sliver: SliverFillRemaining(
                      hasScrollBody: false,
                      child: ErrorScreen(
                        onRetryTapped: () {
                          controller.fetchCart();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.cart.status == Status.completed,
              child: CartTotalBar(
                  total: cart.total.toString(),
                  onCheckoutTapped: () {
                    if (controller.syncStatus != CartSyncStatus.loading &&
                        controller.cart.status != Status.loading) {
                      Get.toNamed(AppRoutes.checkoutRoute,
                          id: NestedNavigationIds.cart);
                    }
                  },
                  isLoading: controller.syncStatus == CartSyncStatus.loading ||
                      controller.cart.status == Status.loading),
            ),
          ],
        );
      },
    );
  }
}
