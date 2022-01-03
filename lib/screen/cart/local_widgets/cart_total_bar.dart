import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CartTotalBar extends StatelessWidget {
  final Function()? onCheckoutTapped;
  const CartTotalBar({Key? key, this.onCheckoutTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimension.paddingMedium),
      height: AppDimension.cartTotalBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'total'.tr.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.darkerGreyColor),
                ),
                Text(
                  '1050.0 TMT',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.blueColor),
                ),
              ],
            ),
          ),
          Flexible(
            child: SizedBox.expand(
              child: ElevatedButton(
                onPressed: onCheckoutTapped,
                child: Text('checkout'.tr.toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
