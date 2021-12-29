import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class SearchTagWidget extends StatelessWidget {
  final String? tagTitle;
  const SearchTagWidget({Key? key, this.tagTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: tagTitle != null,
      child: Container(
        margin: const EdgeInsets.all(AppDimension.marginSmall),
        padding: const EdgeInsets.symmetric(
          vertical: AppDimension.paddingSmall,
          horizontal: AppDimension.paddingMedium,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(AppDimension.borderRadiusSmall),
          boxShadow: const [
            BoxShadow(
              color: AppColors.blackColor6,
              blurRadius: 19,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(tagTitle!),
      ),
    );
  }
}
