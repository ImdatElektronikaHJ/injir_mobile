import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class AddressTitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const AddressTitleWithIcon(
      {Key? key, required this.title, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.blueColor,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimension.paddingSmall,
                vertical: AppDimension.paddingSmall / 2),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
