import 'package:flutter/material.dart';
import 'package:tajir/screen/wishlist/local_widgets/wishlist_app_bar.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/wishlist_product_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const WishlistAppBar(),
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
              WishlistProductItem(
                isShadowVisible: false,
              ),
              WishlistProductItem(),
              WishlistProductItem(
                isShadowVisible: false,
              ),
              WishlistProductItem(),
              WishlistProductItem(
                isShadowVisible: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
