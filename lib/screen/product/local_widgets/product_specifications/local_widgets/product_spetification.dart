import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ProductSpetification extends StatelessWidget {
  final String title;
  final String description;
  final Color primaryColor;

  const ProductSpetification(
      {Key? key,
      required this.title,
      required this.description,
      required this.primaryColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingSmall / 2,
          horizontal: AppDimensions.paddingSmall),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius:
              BorderRadius.circular(AppDimensions.borderRadiusSmall / 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16.0),
            ),
          ),
          Flexible(
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
