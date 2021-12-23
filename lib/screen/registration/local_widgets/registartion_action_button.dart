import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class RegistrationActionButton extends StatelessWidget {
  final double padding;
  final String title;
  final Function()? onActionTapped;

  const RegistrationActionButton(
      {Key? key,
      this.padding = AppDimension.paddingMedium,
      required this.title,
      this.onActionTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding, vertical: AppDimension.paddingSmall),
      child: ElevatedButton(onPressed: onActionTapped, child: Text(title)),
    );
  }
}
