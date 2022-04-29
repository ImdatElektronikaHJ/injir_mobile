import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';

class InitLoginLoginButton extends StatelessWidget {
  final void Function()? onLoginTapped;
  const InitLoginLoginButton({Key? key, this.onLoginTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onLoginTapped,
        child: Text('login_now'.tr),
        style: AppButtonStyle.elevatedButtonStyleLarge,
      ),
    );
  }
}
