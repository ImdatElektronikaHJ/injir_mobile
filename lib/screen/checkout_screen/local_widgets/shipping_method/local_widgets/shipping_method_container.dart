import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ShippingMethodContainer extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function onPressed;

  const ShippingMethodContainer(
      {Key? key,
      required this.isChecked,
      required this.title,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal:
                AppDimension.marginLarge + AppDimension.marginExtraLarge,
            vertical: AppDimension.marginMedium / 2),
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimension.paddingMedium,
            vertical: AppDimension.paddingMedium * 2),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimension.borderRadiusMicro),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackColor10,
              blurRadius: 10.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Text(title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isChecked
                            ? AppColors.blueColor
                            : AppColors.darkGreyColor,
                      )),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: Icon(
                isChecked
                    ? CupertinoIcons.largecircle_fill_circle
                    : CupertinoIcons.circle,
                key: UniqueKey(),
                color: isChecked ? AppColors.blueColor : AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
