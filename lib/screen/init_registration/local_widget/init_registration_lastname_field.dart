import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitRegistrationLastnameField extends StatelessWidget {
  final bool isEnabled;
  final String? Function(String?)? validator;
  final void Function(String?)? onLastNameUpdated;
  const InitRegistrationLastnameField(
      {Key? key, this.validator, this.onLastNameUpdated, this.isEnabled = true})
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
              'last_name'.tr,
              style: AppTextStyle.avenirRegular.copyWith(
                  fontSize: AppDimension.fontSizeDefault,
                  color: Get.theme.hintColor),
            ),
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            enabled: isEnabled,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onLastNameUpdated,
            validator: validator,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Serdarow'),
          ),
        ],
      ),
    );
  }
}
