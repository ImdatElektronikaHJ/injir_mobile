import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/product/local_widgets/product_buttons/local_widgets/product_elevated_button.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/product_counter/product_counter_widget.dart';

class ProductAddToCartWidget extends StatefulWidget {
  const ProductAddToCartWidget({Key? key}) : super(key: key);

  @override
  _ProductAddToCartWidgetState createState() => _ProductAddToCartWidgetState();
}

class _ProductAddToCartWidgetState extends State<ProductAddToCartWidget> {
  bool addedToCart = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: addedToCart
          ? ProductCounterWidget(
              key: UniqueKey(),
              onCartDeleteTapped: () {
                setState(() {
                  addedToCart = false;
                });
              },
            )
          : SizedBox(
            width: double.maxFinite,
              child: ProductElevatedButton(
                key: UniqueKey(),
                title: 'to_cart'.tr,
                onTapped: () {
                  setState(() {
                    addedToCart = true;
                  });
                },
                buttonColor: AppColors.lightRedColor,
              ),
            ),
    );
  }
}
