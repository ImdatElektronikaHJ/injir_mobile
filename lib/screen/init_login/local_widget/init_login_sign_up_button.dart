import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';

class InitLoginSignUpButton extends StatelessWidget {
  final void Function()? onSingUpTapped;
  const InitLoginSignUpButton({Key? key, this.onSingUpTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.shortestSide * 3 / 5,
      child: ElevatedButton(
        onPressed: onSingUpTapped,
        child: Text('sign_up'.tr.toUpperCase()),
        style: AppButtonStyle.elevatedButtonStyleSmall,
      ),
    );
  }
}
