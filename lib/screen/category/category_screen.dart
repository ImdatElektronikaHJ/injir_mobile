import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/screen/category/local_widgets/category_app_bar.dart';
import 'package:tajir/screen/category/local_widgets/category_product.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';
import 'package:tajir/widget/error_screen.dart';
import 'package:tajir/widget/featured_block/featured_block.dart';
import 'package:tajir/widget/list_list_product_widget.dart';

import '../../base/statefull_data.dart';
import '../../controller/category_controller.dart';
import '../../model/category.dart';
import '../../model/list_product.dart';
import 'local_widgets/category_screen_item.dart';

const String categoryId = 'category_id';

class CategoryScreen extends StatelessWidget {
  final int currentIndex;
  const CategoryScreen({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(currentIndex: currentIndex),
      global: false,
      // id: currentIndex,
      builder: (controller) {
        Status status = controller.categoryResponse.status;
        CategoryModel category =
            controller.categoryResponse.data ?? CategoryModel.dummy();
        Status productStatus = controller.categoryProducts.status;
        List<ListProduct> products = controller.categoryProducts.data;
        return ColoredBox(
          color: Get.theme.backgroundColor,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              double maxScrollExtent = scrollInfo.metrics.maxScrollExtent -
                  AppDimension.marginExtraLarge;
              if (scrollInfo.metrics.pixels >= maxScrollExtent) {
                controller.paginateToNextPage(limitPerPage: 10);
                return true;
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                CategoryAppBar(
                  categoryName: category.name,
                ),
                SliverVisibility(
                  visible: status == Status.loading,
                  sliver: const SliverFillRemaining(
                    hasScrollBody: false,
                    child: SizedBox(
                      height: AppDimension.loaderSizeMedium,
                      width: AppDimension.loaderSizeMedium,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: status == Status.completed &&
                      category.subCategories != null &&
                      category.subCategories!.isNotEmpty,
                  sliver: SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimension.paddingMedium,
                        horizontal: AppDimension.paddingSmall),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: AppDimension.paddingSmall,
                              crossAxisSpacing: AppDimension.paddingSmall),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return CategoryScreenItem(
                          categoryEmbedded: category.subCategories![index],
                          onCategoryTapped: () {
                            controller.onCategoryTapped(
                                category.subCategories![index].categoryId);
                          },
                        );
                      }, childCount: category.subCategories!.length),
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: status == Status.completed && products.isNotEmpty,
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CategoryProduct(
                          listProduct: products[index],
                        );
                      },
                      childCount: products.length,
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: productStatus == Status.loading,
                  sliver: const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppDimension.marginMedium),
                      child: SizedBox(
                        height: AppDimension.loaderSizeSmall,
                        width: AppDimension.loaderSizeSmall,
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      ),
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: status == Status.completed &&
                      productStatus == Status.completed &&
                      products.isEmpty,
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'product_list_empty'.tr,
                        style:
                            AppTextStyle.avenirRegular.copyWith(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: productStatus == Status.error,
                  sliver: SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Text('network_error'.tr),
                        ElevatedButton(
                            onPressed: () {
                              controller.retryFetchProducts();
                            },
                            child: Text('retry'.tr)),
                      ],
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: status == Status.completed,
                  sliver: const SliverToBoxAdapter(
                    child: FeaturedBlockWidget(
                      title: 'New items',
                      childWidget: ListListProductWidget(),
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: status == Status.error,
                  sliver: SliverFillRemaining(
                    hasScrollBody: false,
                    child: ErrorScreen(
                      onRetryTapped: () {
                        controller.retry();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
