import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/featured_block/featured_block.dart';
import 'package:tajir/widget/list_list_product_widget.dart';

import 'local_widgets/product_buttons/product_buttons.dart';
import 'local_widgets/product_comments/product_comments.dart';
import 'local_widgets/product_description.dart';
import 'local_widgets/product_expansion_description.dart';
import 'local_widgets/product_image.dart';
import 'local_widgets/product_short_infos/product_short_infos.dart';
import 'local_widgets/product_specifications/product_spetifications.dart';
import 'local_widgets/product_thumb_info/product_thumb_info.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
              isInWishlist: true,
              onFavouriteTapped: (bool isInWishlist) {
                _onFavouriteTapped(isInWishlist);
              },
              onBackTapped: _onBackTapped,
            ),
            const ProductThumbInfo(
              inStock: true,
            ),
            const ProductShortInfos(),
            const ProductButtons(),
            ProductExpansionDescription(
              title: 'description'.tr,
              child: const ProductDescription(
                description:
                    'Смартфон Samsung Galaxy Note 10+ 256Gb White (SM-N975F) с диагональю 6,8 дюймов характеризуется мощностью ноутбука благодаря 8-ядерному процессору и RAM объемом 12 Гб. Устройство имеет встроенную память 256 Гб, которая может расширяться до 768 Гб. Умное электронное перо поможет в управлении функциями телефона и создании заметок, скетчей. С помощью жестов пользователь может удаленно настраивать громкость воспроизведения, приближать и отдалять объекты на камере, выбирать снимки и многое другое.',
              ),
            ),
            ProductExpansionDescription(
              title: 'specifications'.tr,
              child: const ProductSpecifications(),
            ),
            ProductExpansionDescription(
              title: 'reviews'.tr,
              child: const ProductComments(),
            ),
            FeaturedBlockWidget(
              title: 'Related products',
              childWidget: const ListListProductWidget(),
              onSeeAllTapped: _onSeeAllTapped,
            ),
          ],
        ),
      ),
    );
  }

  void _onSeeAllTapped() {
    //TODO: add click listener
    print('on see all');
  }

  _onFavouriteTapped(bool isInWishlist) {
    print(isInWishlist);
  }

  _onBackTapped() {
    Get.back(id: NestedNavigationIds.home);
  }
}
