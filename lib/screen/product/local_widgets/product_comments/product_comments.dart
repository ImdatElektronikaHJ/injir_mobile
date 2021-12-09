import 'package:flutter/material.dart';
import 'package:tajir/screen/product/local_widgets/product_review/product_review.dart';
import 'local_widgets/product_comment_block/product_comment_block.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++)
          const ProductCommentBlock(
            title: 'Jack Biber',
            rating: 4.9,
            description:
                'Nike is a leading sports shoes brand in the world, with a youthful and dynamic',
            date: '09:30 - 23/10/2021',
          ),
        const ProductReview(),
      ],
    );
  }
}
