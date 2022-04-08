import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class LoginActionButton extends StatelessWidget {
  final double padding;
  final String title;
  final bool? isLoading;
  final Function()? onActionTapped;

  const LoginActionButton(
      {Key? key,
      this.padding = AppDimension.paddingMedium,
      required this.title,
      this.onActionTapped,
      this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padding, vertical: AppDimension.paddingSmall),
      child: SizedBox(
        height: 60.0,
        child: ElevatedButton(
          onPressed: onActionTapped,
          child: isLoading!
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: 1.0,
                )
              : Text(title),
        ),
      ),
    );
  }
}
