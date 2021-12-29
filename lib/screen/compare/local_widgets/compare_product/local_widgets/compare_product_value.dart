import 'package:flutter/material.dart';

import 'compare_product_image.dart';
import 'compare_product_price.dart';
import 'compare_product_title.dart';

class CompareProductValue extends StatelessWidget {
  final String? imageUrl;
  final double price;
  final String title;

  const CompareProductValue(
      {Key? key, this.imageUrl, required this.price, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: Center(
            child: CompareProductImage(
              imageUrl: imageUrl,
            ),
          ),
        ),
        CompareProductPrice(
          price: price,
        ),
        CompareProductTitle(
          title: title,
        ),
      ],
    );
  }
}
