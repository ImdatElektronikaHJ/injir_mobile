
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class ProductReviewStars extends StatefulWidget {
  final double rating;

  const ProductReviewStars({Key? key, required this.rating}) : super(key: key);

  @override
  State<ProductReviewStars> createState() => _ProductReviewStarsState();
}

class _ProductReviewStarsState extends State<ProductReviewStars> {
  double? rating;

  @override
  void initState() {
    rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                if (rating != i) rating = i.toDouble();
              });
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: i <= rating!.floor()
                  ? const Icon(
                      CupertinoIcons.star_fill,
                      key: Key('true'),
                      color: AppColors.amberColor,
                    )
                  : const Icon(
                      CupertinoIcons.star_fill,
                      key: Key('false'),
                      color: AppColors.greyColor,
                    ),
            ),
          ),
      ],
    );
  }
}
