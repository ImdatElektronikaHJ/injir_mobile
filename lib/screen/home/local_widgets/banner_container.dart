import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class BannerContainer extends StatelessWidget {
  final Widget child;

  const BannerContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.bannerHeight,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimension.marginMedium,
          vertical: AppDimension.marginSmall / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimension.borderRadiusMedium),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
