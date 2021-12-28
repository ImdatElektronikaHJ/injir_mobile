import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class CompareSpecificationValue extends StatelessWidget {
  final Widget value;

  const CompareSpecificationValue({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimension.listProductWidth,
      alignment: Alignment.centerLeft,
      child: value,
    );
  }
}
