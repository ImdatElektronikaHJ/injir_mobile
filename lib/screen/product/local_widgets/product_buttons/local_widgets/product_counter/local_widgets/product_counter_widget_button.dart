import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

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
            AppDimensions.borderRadiusSmall,
          ),
        ),
        fixedSize: const Size(
          AppDimensions.productElevatedButtonHeight / 2,
          AppDimensions.productElevatedButtonHeight,
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
