import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class RegistrationPhoneField extends StatelessWidget {
  final void Function(String)? onValueChanged;
  final String? Function(String?)? validation;
  final bool? isEnabled;
  const RegistrationPhoneField(
      {Key? key, this.onValueChanged, this.validation, this.isEnabled})
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
              'phone_number'.tr,
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
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: '+99361234567'),
          ),
        ],
      ),
    );
  }
}
