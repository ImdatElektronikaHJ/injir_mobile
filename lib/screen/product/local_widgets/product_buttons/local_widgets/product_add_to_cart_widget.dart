import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/product/local_widgets/product_buttons/local_widgets/product_elevated_button.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/product_counter/product_counter_widget.dart';

class ProductAddToCartWidget extends StatelessWidget {
  final void Function()? onAddToCartTapped;
  final void Function()? onIncrementTapped;
  final void Function()? onDecrementTapped;
  final int? count;
  final double? width;
  const ProductAddToCartWidget(
      {Key? key,
      required this.onAddToCartTapped,
      this.onIncrementTapped,
      this.onDecrementTapped,
      this.count,
      this.width = 170.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCart = count != null && count! > 0.00;
    return SizedBox(
      width: width,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: isCart
            ? ProductCounterWidget(
                key: UniqueKey(),
                onIncrementTapped: () {
                  onIncrementTapped!();
                },
                onDecrementTapped: () {
                  onDecrementTapped!();
                },
                count: count,
              )
            : SizedBox(
                width: double.maxFinite,
                child: ProductElevatedButton(
                  key: UniqueKey(),
                  title: 'to_cart'.tr,
                  onTapped: () {
                    onAddToCartTapped!();
                  },
                  buttonColor: AppColors.lightRedColor,
                ),
              ),
      ),
    );
  }
}
