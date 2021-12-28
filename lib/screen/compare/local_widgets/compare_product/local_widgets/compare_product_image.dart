import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class CompareProductImage extends StatelessWidget {
  final String? imageUrl;

  const CompareProductImage({Key? key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimension.paddingSmall),
      child: Image.asset(imageUrl!),
    );
  }
}
