import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/product_comment_block_rating.dart';
import 'local_widgets/product_comments_block_date.dart';

class ProductCommentBlock extends StatelessWidget {
  final String title;
  final double rating;
  final String description;
  final String date;

  const ProductCommentBlock(
      {Key? key,
      required this.title,
      required this.rating,
      required this.description,
      required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimension.marginMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 17.0)),
          const ProductCommentRating(rating: 4.9),
          Text(
            description,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 16.0,
                ),
          ),
          ProductCommentBlockDate(date: date),
        ],
      ),
    );
  }
}
