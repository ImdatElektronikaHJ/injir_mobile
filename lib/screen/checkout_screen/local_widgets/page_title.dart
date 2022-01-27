import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimension.paddingMedium),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
