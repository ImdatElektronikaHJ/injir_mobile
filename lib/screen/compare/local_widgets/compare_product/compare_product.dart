import 'package:flutter/material.dart';

import 'local_widgets/compare_product_style.dart';
import 'local_widgets/compare_product_value.dart';

class CompareProduct extends StatelessWidget {
  const CompareProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CompareProductStyle(
      child: CompareProductValue(
        imageUrl: 'assets/images/placeholder/samsung.png',
        price: 12345,
        title:
            'Смартфон Samsung Galaxy Note 10+ 12/256GB White(SM-N975FZWDSER)',
      ),
    );
  }
}
