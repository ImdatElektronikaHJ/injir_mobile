import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class DashboardContainer extends StatelessWidget {
  final Widget child;
  const DashboardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppDimension.marginMedium),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimension.borderRadiusLarge),
          topRight: Radius.circular(AppDimension.borderRadiusLarge),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
