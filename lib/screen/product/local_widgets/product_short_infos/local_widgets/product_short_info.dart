import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ProductShortInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProductShortInfo(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingSmall / 2,
          horizontal: AppDimensions.marginMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            maxLines: 2,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
