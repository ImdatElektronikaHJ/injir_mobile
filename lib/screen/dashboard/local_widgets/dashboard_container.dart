import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimensions.dart';

class DashboardContainer extends StatelessWidget {
  final Widget child;
  const DashboardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppDimensions.marginMedium),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.borderRadiusLarge),
          topRight: Radius.circular(AppDimensions.borderRadiusLarge),
        ),
      ),
      child: child,
    );
  }
}
