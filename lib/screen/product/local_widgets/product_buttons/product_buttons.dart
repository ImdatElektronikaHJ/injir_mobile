import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/product_add_to_cart_widget.dart';
import 'local_widgets/product_elevated_button.dart';
import 'local_widgets/product_text_button.dart';

class ProductButtons extends StatelessWidget {
  final int? cartProductQuantity;
  final void Function()? onAddToCartTapped;
  final void Function()? onIncrementTapped;
  final void Function()? onDecrementTapped;
  // final int? count;
  const ProductButtons({
    Key? key,
    required this.cartProductQuantity,
    this.onAddToCartTapped,
    this.onIncrementTapped,
    this.onDecrementTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimension.marginMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductTextButton(
            title: 'contact_seller'.tr,
            onTapped: () {
              print('asd');
            },
          ),
          ProductTextButton(
            title: 'compare'.tr,
            onTapped: () {
              print('asd');
            },
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall),
            child: Row(
              children: [
                Expanded(
                  child: ProductAddToCartWidget(
                    onAddToCartTapped: () {
                      onAddToCartTapped!();
                    },
                    onDecrementTapped: () {
                      onDecrementTapped!();
                    },
                    onIncrementTapped: () {
                      onIncrementTapped!();
                    },
                    count: cartProductQuantity,
                  ),
                ),
                const SizedBox(width: AppDimension.marginMedium),
                Expanded(
                  child: ProductElevatedButton(
                    title: 'buy'.tr,
                    onTapped: () {
                      print('das');
                    },
                    buttonColor: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
