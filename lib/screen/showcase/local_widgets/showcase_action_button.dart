import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class ShowcaseActionButton extends StatelessWidget {
  final Widget child;
  final Function()? onActionTapped;
  const ShowcaseActionButton(
      {Key? key, required this.child, this.onActionTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.shortestSide;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 6, vertical: AppDimension.paddingSmall / 2),
      child: ElevatedButton(
        onPressed: onActionTapped,
        child: child,
      ),
    );
  }
}
