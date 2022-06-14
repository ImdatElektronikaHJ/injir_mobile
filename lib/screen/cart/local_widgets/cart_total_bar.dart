import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CartTotalBar extends StatelessWidget {
  final Function()? onCheckoutTapped;
  final String? total;
  final bool isLoading;
  const CartTotalBar(
      {Key? key, this.onCheckoutTapped, this.total, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimension.paddingMedium),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  '${total ?? 0} TMT',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.blueColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: AppButtonStyle.elevatedButtonStyleMedium,
              onPressed: onCheckoutTapped,
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.whiteColor,
                    ))
                  : Text('checkout'.tr.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
