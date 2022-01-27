import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/screen/cart/local_widgets/cart_app_bar.dart';
import 'package:tajir/screen/cart/local_widgets/cart_product_item.dart';
import 'package:tajir/screen/cart/local_widgets/cart_total_bar.dart';
import 'package:tajir/theme/app_dimension.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: CustomScrollView(
          slivers: [
            const CartAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimension.paddingMedium),
                child: Text(
                  '5 товаров',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  CartProductItem(
                    isShadowVisible: false,
                  ),
                  CartProductItem(),
                  CartProductItem(
                    isShadowVisible: false,
                  ),
                  CartProductItem(),
                  CartProductItem(
                    isShadowVisible: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      CartTotalBar(
        onCheckoutTapped: () {
          Get.toNamed(AppRoutes.checkoutRoute, id: NestedNavigationIds.cart);
        },
      ),
    ]);
  }
}
