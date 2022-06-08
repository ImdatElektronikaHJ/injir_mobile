import 'package:flutter/material.dart';
import 'package:tajir/model/list_product.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/list_product/list_product_widget.dart';

class ListListProductWidget extends StatelessWidget {
  final List<ListProduct>? productList;
  const ListListProductWidget({Key? key, this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          AppDimension.listProductHeight + AppDimension.marginExtraLarge * 2,
      child: ListView.builder(
        itemBuilder: (context, index) => ListProductWidget(
          listProduct: productList?[index],
        ),
        itemCount: productList?.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
