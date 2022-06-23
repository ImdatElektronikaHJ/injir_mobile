import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/account_login_status_controller.dart';
import 'package:tajir/controller/wishlist_controller.dart';
import 'package:tajir/screen/wishlist/local_widgets/wishlist_app_bar.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/util/interpolation_util.dart';
import 'package:tajir/widget/error_screen.dart';

import 'local_widgets/wishlist_product_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      builder: (controller) {
        bool isLoggedIn =
            controller.accountLoginStatus == AccountLoginStatus.loggedIn;
        return CustomScrollView(
          slivers: [
            const WishlistAppBar(),
            SliverVisibility(
              visible: controller.accountLoginStatus ==
                  AccountLoginStatus.notLoggedIn,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text('user_not_logged_in'.tr),
                ),
              ),
            ),
            SliverVisibility(
              visible:
                  isLoggedIn && controller.wishList.status == Status.completed,
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingMedium,
                      vertical: AppDimension.marginMedium),
                  child: Text(
                    InterpolationUtil.interpolate("product_count".tr,
                        [controller.wishList.data?.length ?? 0]),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            SliverVisibility(
              visible: isLoggedIn &&
                  controller.wishList.status == Status.completed &&
                  controller.wishList.data != null &&
                  controller.wishList.data!.isEmpty,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text('wishlist_is_empty'.tr),
                ),
              ),
            ),
            SliverVisibility(
              visible: isLoggedIn &&
                  controller.wishList.status == Status.completed &&
                  controller.wishList.data != null &&
                  controller.wishList.data!.isNotEmpty,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  controller.wishList.data != null
                      ? controller.wishList.data!.entries
                          .map((product) => WishlistProductItem(
                                product: product.value,
                                onRemoveTapped: () {
                                  controller.removeProduct(product.value.id);
                                },
                                onProductTapped: () {
                                  controller.onProductTapped(product.value.id);
                                },
                              ))
                          .toList()
                      : [],
                ),
              ),
            ),
            SliverVisibility(
              visible:
                  controller.accountLoginStatus == AccountLoginStatus.loading ||
                      controller.wishList.status == Status.loading,
              sliver: const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
            SliverVisibility(
              visible:
                  controller.accountLoginStatus == AccountLoginStatus.error,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('error_getting_account'.tr),
                    ElevatedButton(
                        onPressed: () {
                          controller.onAccountRetryTapped();
                        },
                        child: Text('retry'.tr)),
                  ],
                ),
              ),
            ),
            SliverVisibility(
              visible: controller.wishList.status == Status.error,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: ErrorScreen(onRetryTapped: () {
                  controller.fetchWishList();
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
