import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class CategoryAppBar extends StatelessWidget {
  final String categoryName;
  const CategoryAppBar({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      backgroundColor: Theme.of(context).backgroundColor,
      centerTitle: false,
      title: Align(
        alignment: Alignment.centerRight,
        child:
            Text(categoryName, style: Theme.of(context).textTheme.subtitle2!),
      ),
      floating: true,
    );
  }
}
