import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimensions.dart';

class RatingWidget extends StatelessWidget {
  final double? rating;
  final int? rateTotal;
  final double iconSize;

  const RatingWidget(
      {Key? key, this.rating = 0, this.rateTotal = 0, this.iconSize = 14.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingSmall / 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getRating()!,
          const SizedBox(
            width: AppDimensions.marginSmall / 2,
          ),
          Text(
            '($rateTotal)',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  Widget? _getRating() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            i < rating!.floor()
                ? CupertinoIcons.star_fill
                : CupertinoIcons.star,
            color: AppColors.amberColor,
            size: iconSize,
          ),
      ],
    );
  }
}
