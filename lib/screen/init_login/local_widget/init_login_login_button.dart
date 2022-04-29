import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class InitLoginLoginButton extends StatelessWidget {
  final void Function()? onLoginTapped;
  final bool isLoading;
  const InitLoginLoginButton(
      {Key? key, this.onLoginTapped, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isLoading
          ? ElevatedButton(
              onPressed: onLoginTapped,
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
              onPressed: onLoginTapped,
              child: Text('login_now'.tr),
              style: AppButtonStyle.elevatedButtonStyleLarge,
            ),
    );
  }
}
