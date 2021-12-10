import 'package:flutter/material.dart';
import 'package:tajir/screen/product/local_widgets/product_specifications/local_widgets/product_spetification.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ProductSpecificationWithTitle extends StatelessWidget {
  final String title;
  final List<Map<String, String>> specifications;
  const ProductSpecificationWithTitle(
      {Key? key, required this.specifications, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        for (int i = 0; i < specifications.length; i++)
          ProductSpetification(
            title: specifications[i]['title']!,
            description: specifications[i]['spec']!,
            primaryColor: i % 2 != 0
                ? AppColors.whiteColor
                : AppColors.lightBlueGreyColor,
          ),
      ],
    );
  }
}
