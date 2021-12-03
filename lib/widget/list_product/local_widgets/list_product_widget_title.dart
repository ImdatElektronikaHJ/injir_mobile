import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class ListProductTitleBlock extends StatelessWidget {
  final String title;

  const ListProductTitleBlock({Key? key, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall,
          vertical: AppDimensions.paddingSmall / 2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.0),
        maxLines: 3,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
