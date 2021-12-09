import 'package:flutter/material.dart';

import 'local_widgets/product_short_info.dart';

class ProductShortInfos extends StatelessWidget {
  const ProductShortInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProductShortInfo(
          title: 'Бренды',
          subtitle: 'Samsung',
        ),
        ProductShortInfo(
          title: 'Код товара',
          subtitle: 'АР100100',
        ),
        ProductShortInfo(
          title: 'Продавец',
          subtitle: 'Electshop',
        ),
        ProductShortInfo(
          title: 'Просмотрено',
          subtitle: '1202',
        ),
      ],
    );
  }
}
