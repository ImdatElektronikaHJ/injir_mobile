import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class LoginActionButton extends StatelessWidget {
  final bool isLoading;
  final Function()? onActionTapped;

  const LoginActionButton(
      {Key? key, this.onActionTapped, required this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isLoading
          ? ElevatedButton(
              onPressed: onActionTapped,
              child: SizedBox(
                height:
                    AppDimension.fontSizeLarge + AppDimension.paddingLarge - 1,
                width:
                    AppDimension.fontSizeLarge + AppDimension.paddingLarge - 1,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              style: AppButtonStyle.elevatedButtonStyleLarge.copyWith(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(AppDimension.paddingMedium),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onActionTapped,
              child: Text('sign_in'.tr),
              style: AppButtonStyle.elevatedButtonStyleLarge,
            ),
    );
  }
}
