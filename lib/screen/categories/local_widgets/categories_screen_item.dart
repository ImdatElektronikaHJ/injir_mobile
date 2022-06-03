import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/caching_image.dart';

import '../../../model/list_category.dart';

class CategoriesScreenItem extends StatelessWidget {
  final void Function()? onCategoryTapped;
  final ListCategory? listCategory;

  const CategoriesScreenItem(
      {Key? key, this.onCategoryTapped, this.listCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(AppDimension.paddingSmall),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.blackColor6,
                blurRadius: 19,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius:
                BorderRadius.circular(AppDimension.borderRadiusSmall)),
        child: Column(children: [
          Expanded(
            child: CachingImage(
              listCategory?.image,
            ),
          ),
          Text(
            '${listCategory?.name}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]),
      ),
      onTap: () {
        onCategoryTapped!();
      },
    );
  }
}
