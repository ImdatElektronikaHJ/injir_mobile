import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitRegistrationPasswordField extends StatelessWidget {
  final String? Function(String?)? validator;
  final bool isObscured;
  final bool isEnabled;
  final void Function()? toggleVisibility;
  final void Function(String?)? onPasswordUpdated;
  const InitRegistrationPasswordField(
      {Key? key,
      this.validator,
      this.onPasswordUpdated,
      this.isEnabled = true,
      this.isObscured = true,
      this.toggleVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppDimension.paddingSmall,
          bottom: AppDimension.paddingOverLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimension.paddingSmall),
            child: Text(
              'password'.tr,
              style: AppTextStyle.avenirRegular.copyWith(
                  fontSize: AppDimension.fontSizeDefault,
                  color: Get.theme.hintColor),
            ),
          ),
          TextFormField(
            enabled: isEnabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onPasswordUpdated,
            validator: validator,
            obscureText: isObscured,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: toggleVisibility,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimension.paddingSmall),
                  child: Icon(
                    isObscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                    color: Get.theme.hintColor,
                  ),
                ),
              ),
              hintText: '••••••••••••••••',
            ),
          ),
        ],
      ),
    );
  }
}
