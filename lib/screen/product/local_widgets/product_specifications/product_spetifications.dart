import 'package:flutter/material.dart';

import 'local_widgets/product_spetification_with_title.dart';

class ProductSpecifications extends StatelessWidget {
  const ProductSpecifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ProductSpecificationWithTitle(
          title: 'Основные характеристики',
          specifications: [
            {'title': '32424', 'spec': 'fsdafa'},
            {'title': 'fdsfertr', 'spec': 'fsadf'},
            {'title': 'rett', 'spec': 'fdsafdsa'},
            {'title': 'dsfsdafasdfdsf', 'spec': 'sdfsdfadsfdsfsda'},
          ],
        ),
        ProductSpecificationWithTitle(
          title: 'Заводские данные о товаре',
          specifications: [
            {'title': '32424', 'spec': 'fsdafa'},
            {'title': 'fdsfertr', 'spec': 'fsadf'},
            {'title': 'rett', 'spec': 'fdsafdsa'},
            {
              'title': 'dsfsdafasdfdsf',
              'spec': 'sdfsdfadsfdfsdafsdfsdafsdfsadfdsfsdafsdsfsda'
            },
            {'title': 'fdsfads', 'spec': 'ffdsfdsfdsafsdafsdfdsfasfadsfasdfsd'},
            {'title': 'fdsfdsfsdf', 'spec': 'fdsfa'},
            {'title': 'rwerwerwe', 'spec': 'dsfasdfa'},
            {'title': 'fsdfsdf', 'spec': 'dsafsdf'},
            {'title': 'rett', 'spec': 'fdsafdsa'},
            {'title': 'dsfsdafasdfdsf', 'spec': 'sdfsdfadsfdsfsda'},
            {'title': 'fdsfads', 'spec': 'dsfadsf'},
            {'title': 'fdsfdsfsdf', 'spec': 'fdsfa'},
            {'title': 'rwerwerwe', 'spec': 'dsfasdfa'},
            {'title': 'fsdfsdf', 'spec': 'dsafsdf'},
          ],
        ),
      ],
    );
  }
}
