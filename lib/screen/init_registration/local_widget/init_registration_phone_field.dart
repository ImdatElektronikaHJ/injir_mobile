import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitRegistrationPhoneField extends StatelessWidget {
  final bool isEnabled;
  final String? Function(String?)? validator;
  final void Function(String?)? onPhoneUpdated;
  const InitRegistrationPhoneField(
      {Key? key, this.validator, this.onPhoneUpdated, this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimension.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppDimension.paddingSmall),
            child: Text(
              'phone_number'.tr,
              style: AppTextStyle.avenirRegular.copyWith(
                  fontSize: AppDimension.fontSizeDefault,
                  color: Get.theme.hintColor),
            ),
          ),
          TextFormField(
            enabled: isEnabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onPhoneUpdated,
            validator: validator,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: '+99365000000'),
          ),
        ],
      ),
    );
  }
}
