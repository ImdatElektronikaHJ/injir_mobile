import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class RegistrationRegisterButton extends StatelessWidget {
  final Function()? onActionTapped;
  final bool isLoading;

  const RegistrationRegisterButton(
      {Key? key, this.onActionTapped, this.isLoading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall),
      child: ElevatedButton(
        onPressed: onActionTapped,
        child: isLoading
            ? SizedBox(
                height:
                    AppDimension.fontSizeLarge + AppDimension.paddingLarge - 1,
                width:
                    AppDimension.fontSizeLarge + AppDimension.paddingLarge - 1,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text('create_account'.tr.toUpperCase()),
        style: AppButtonStyle.elevatedButtonStyleMedium,
      ),
    );
  }
}
