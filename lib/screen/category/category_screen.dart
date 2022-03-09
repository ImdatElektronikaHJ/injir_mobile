import 'package:flutter/material.dart';
import 'package:tajir/screen/categories/local_widgets/categories_screen_item.dart';
import 'package:tajir/screen/category/local_widgets/category_app_bar.dart';
import 'package:tajir/screen/category/local_widgets/category_product.dart';
import 'package:tajir/screen/wishlist/local_widgets/wishlist_product_item.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/featured_block/featured_block.dart';
import 'package:tajir/widget/list_list_product_widget.dart';

import 'local_widgets/category_screen_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CategoryAppBar(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimension.paddingMedium,
              horizontal: AppDimension.paddingSmall),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppDimension.paddingSmall,
                crossAxisSpacing: AppDimension.paddingSmall),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return const CategoryScreenItem();
            }, childCount: 4),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return const CategoryProdcut();
            },
            childCount: 7,
          ),
        ),
        const SliverToBoxAdapter(
          child: FeaturedBlockWidget(
            title: 'New items',
            childWidget: ListListProductWidget(),
          ),
        )
      ],
    );
  }
}
