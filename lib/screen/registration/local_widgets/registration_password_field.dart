import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class RegistrationPasswordField extends StatelessWidget {
  final void Function(String)? onValueChanged;
  final String? Function(String?)? validation;
  final bool? isEnabled;
  final bool obscureText;
  final void Function()? toggleObscure;
  final Widget? suffix;
  const RegistrationPasswordField(
      {Key? key,
      this.onValueChanged,
      this.validation,
      this.isEnabled,
      this.obscureText = true,
      this.toggleObscure,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.paddingSmall,
      ),
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
            onChanged: onValueChanged,
            validator: validation,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: '*************',
              suffixIcon: GestureDetector(
                onTap: toggleObscure,
                child: Icon(obscureText
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
