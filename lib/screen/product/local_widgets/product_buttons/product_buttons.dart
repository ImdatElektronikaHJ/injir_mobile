import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

import 'local_widgets/product_add_to_cart_widget.dart';
import 'local_widgets/product_elevated_button.dart';
import 'local_widgets/product_text_button.dart';

class ProductButtons extends StatelessWidget {
  const ProductButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimensions.marginMedium),
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
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingSmall),
            child: Row(
              children: [
                const Expanded(child: ProductAddToCartWidget()),
                const SizedBox(width: AppDimensions.marginMedium),
                Expanded(
                  child: ProductElevatedButton(
                    title: 'buy'.tr,
                    onTapped: () {
                      print('das');
                    },
                    buttonColor: AppColors.darkBlueColor,
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