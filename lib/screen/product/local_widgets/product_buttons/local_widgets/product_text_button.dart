import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ProductTextButton extends StatelessWidget {
  final String title;
  final Function? onTapped;

  const ProductTextButton({Key? key, required this.title, this.onTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapped!(),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: AppColors.darkBlueColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
