import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'compare_product/compare_product_with_icon.dart';

class CompareProductList extends StatelessWidget {
  final ScrollController? controller;
  final Widget child;
  final Function()? onDeleteTapped;

  const CompareProductList(
      {Key? key, this.controller, this.onDeleteTapped, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.compareProductWithIconHeight,
      child: ListView.builder(
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CompareProductWithIcon(
          onDeleteTapped: onDeleteTapped,
          child: child,
        ),
        itemCount: 5,
      ),
    );
  }
}
