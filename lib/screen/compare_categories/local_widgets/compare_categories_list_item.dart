import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class CompareListItem extends StatelessWidget {
  final String title;
  final String count;
  final Function()? onItemTapped;
  const CompareListItem(
      {Key? key, required this.title, required this.count, this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTapped,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimension.paddingMedium),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimension.paddingSmall,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(title,
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Text(count, style: Theme.of(context).textTheme.subtitle1),
                ],
              ),
            ),
            const Divider(
              color: AppColors.lightGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
