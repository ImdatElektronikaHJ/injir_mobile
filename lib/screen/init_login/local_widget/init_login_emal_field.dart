import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitLoginEmailField extends StatelessWidget {
  final bool isEnabled;
  final String? Function(String?)? validator;
  final void Function(String?)? onEmailUpdated;
  const InitLoginEmailField(
      {Key? key, this.validator, this.onEmailUpdated, this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppDimension.paddingExtraLarge * 2,
          bottom: AppDimension.paddingExtraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimension.paddingSmall),
            child: Text(
              'email'.tr,
              style: AppTextStyle.avenirRegular.copyWith(
                  fontSize: AppDimension.fontSizeDefault,
                  color: Get.theme.hintColor),
            ),
          ),
          TextFormField(
            enabled: isEnabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onEmailUpdated,
            validator: validator,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration:
                const InputDecoration(hintText: 'Tajirtrading@gmail.com'),
          ),
        ],
      ),
    );
  }
}
