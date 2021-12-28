import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/compare_specification_background_style.dart';

class CompareSpecification extends StatelessWidget {
  final String title;
  final ScrollController? controller;
  final Widget child;
  const CompareSpecification(
      {Key? key, required this.title, this.controller, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.paddingMedium,
          vertical: AppDimension.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
          ),
          CompareSpecificationValueBackgroundStyle(
            child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingSmall),
                  child: Center(child: child),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
