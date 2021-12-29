import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class SearchHeader extends StatelessWidget {
  final String? title;
  const SearchHeader({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimension.paddingExtraLarge,
          horizontal: AppDimension.paddingMedium),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
