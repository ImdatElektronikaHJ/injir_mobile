import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class ListProductRatingBlock extends StatelessWidget {
  final double? rating;
  final int? rateTotal;

  const ListProductRatingBlock({Key? key, this.rating = 0, this.rateTotal = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(AppDimension.paddingSmall / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getRating()!,
            const SizedBox(
              width: AppDimension.marginSmall / 2,
            ),
            Text(
              '($rateTotal)',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
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
            size: 14.0,
          ),
      ],
    );
  }
}
