import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

import 'local_widgets/featured_block_title.dart';

class FeaturedBlockWidget extends StatelessWidget {
  final Widget childWidget;
  final String title;
  final Function? onSeeAllTapped;
  const FeaturedBlockWidget({
    Key? key,
    required this.childWidget,
    required this.title,
    this.onSeeAllTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.marginMedium),
      child: Column(
        children: [
          const SizedBox(height: AppDimensions.marginSmall),
          FeaturedBlockTitle(
            title: title,
            onSeeAllTapped: onSeeAllTapped,
          ),
          childWidget,
        ],
      ),
    );
  }
}
