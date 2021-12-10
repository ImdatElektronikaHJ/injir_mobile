import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class ProductCommentBlockDate extends StatelessWidget {
  final String date;

  const ProductCommentBlockDate({Key? key, required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          CupertinoIcons.clock,
          color: Colors.grey,
          size: 18.0,
        ),
        const SizedBox(
          width: AppDimension.paddingSmall / 2,
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
