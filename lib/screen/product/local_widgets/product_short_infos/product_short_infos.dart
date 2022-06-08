import 'package:flutter/material.dart';
import 'package:tajir/model/product.dart';

import 'local_widgets/product_short_info.dart';

class ProductShortInfos extends StatelessWidget {
  final Product product;
  const ProductShortInfos({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: add connecting with api
    return Column(
      children: [
        Visibility(
          visible: product.manufacturer != null,
          child: ProductShortInfo(
            title: 'Бренды',
            subtitle: product.manufacturer ?? '',
          ),
        ),
        Visibility(
          visible: product.model != null,
          child: ProductShortInfo(
            title: 'Код товара',
            subtitle: product.model!,
          ),
        ),
        // Visibility(
        //   visible: product.sale,
        //   child: ProductShortInfo(
        //     title: 'Продавец',
        //     subtitle: 'Electshop',
        //   ),
        // ),
        // ProductShortInfo(
        //   title: 'Просмотрено',
        //   subtitle: '1202',
        // ),
      ],
    );
  }
}
