import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class BannerContainer extends StatelessWidget {
  final Widget child;

  const BannerContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.bannerHeight,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.marginMedium,
          vertical: AppDimensions.marginSmall / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
      ),
      child: child,
    );
  }
}
