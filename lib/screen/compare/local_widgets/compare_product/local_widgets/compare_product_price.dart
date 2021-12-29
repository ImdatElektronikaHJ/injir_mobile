import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class CompareProductPrice extends StatelessWidget {
  final double? price;

  const CompareProductPrice({Key? key, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$price TMT',
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: AppColors.darkBlueColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
    );
  }
}
