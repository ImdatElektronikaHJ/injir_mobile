import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';

class InitRegistrationSignInButton extends StatelessWidget {
  final void Function()? onSingInTapped;
  const InitRegistrationSignInButton({Key? key, this.onSingInTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.shortestSide * 3 / 5,
      child: ElevatedButton(
        onPressed: onSingInTapped,
        child: Text('sign_in'.tr.toUpperCase()),
        style: AppButtonStyle.elevatedButtonStyleSmall,
      ),
    );
  }
}
