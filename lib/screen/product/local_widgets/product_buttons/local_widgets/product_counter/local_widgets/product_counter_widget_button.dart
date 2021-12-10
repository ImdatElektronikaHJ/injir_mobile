import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ProductCounterWidgetButton extends StatelessWidget {
  final String title;
  final Function onButtonTapped;

  const ProductCounterWidgetButton(
      {Key? key, required this.title, required this.onButtonTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        shadowColor: AppColors.blackColor25,
        textStyle: Theme.of(context)
            .textTheme
            .button!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimension.borderRadiusSmall,
          ),
        ),
        fixedSize: const Size(
          AppDimension.productElevatedButtonHeight / 2,
          AppDimension.productElevatedButtonHeight,
        ),
      ),
      onPressed: () => onButtonTapped(),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
