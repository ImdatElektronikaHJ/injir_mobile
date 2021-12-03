import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';
import 'package:tajir/widget/list_product/list_product_widget.dart';

class ListListProductWidget extends StatelessWidget {
  const ListListProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.listProductHeight + AppDimensions.marginExtraLarge * 2,
      child: ListView.builder(
        itemBuilder: (context, index) => const ListProductWidget(),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
