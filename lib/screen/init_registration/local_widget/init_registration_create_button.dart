import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_dimension.dart';

class InitRegistrationCreateButton extends StatelessWidget {
  final void Function()? onCreateTapped;
  final bool isLoading;
  const InitRegistrationCreateButton(
      {Key? key, this.onCreateTapped, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: isLoading
          ? ElevatedButton(
              onPressed: onCreateTapped,
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
              onPressed: onCreateTapped,
              child: Text('create_user'.tr),
              style: AppButtonStyle.elevatedButtonStyleLarge,
            ),
    );
  }
}
