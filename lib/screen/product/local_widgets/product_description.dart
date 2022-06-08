import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  final String description;
  const ProductDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description.isNotEmpty ? description : 'no_description'.tr,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
