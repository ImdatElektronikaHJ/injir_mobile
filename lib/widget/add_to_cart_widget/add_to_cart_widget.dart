import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/widget/product_counter/product_counter_widget.dart';

import 'add_to_cart_button.dart';

class AddToCartWidget extends StatelessWidget {
  final void Function()? onAddToCartTapped;
  final void Function()? onIncrementTapped;
  final void Function()? onDecrementTapped;
  final int? count;
  final double? width;
  final double? height;
  const AddToCartWidget(
      {Key? key,
      required this.onAddToCartTapped,
      this.onIncrementTapped,
      this.onDecrementTapped,
      this.count,
      this.width = 170.0,
      this.height = 40.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCart = count != null && count! > 0.00;
    return SizedBox(
      width: width,
      height: height,
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
                child: AddToCartButton(
                  key: UniqueKey(),
                  title: 'to_cart'.tr,
                  onTapped: () {
                    onAddToCartTapped!();
                  },
                ),
              ),
      ),
    );
  }
}
