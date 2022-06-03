import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_dimension.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String fieldName;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onValueChanged;
  final String? placeHolder;
  final Widget? suffix;
  final String? Function(String?)? validation;
  final String? initialValue;
  const SimpleTextField({
    Key? key,
    required this.fieldName,
    required this.obscureText,
    this.maxLength,
    this.controller,
    this.inputFormatters,
    this.onValueChanged,
    this.placeHolder,
    this.validation,
    this.suffix,
    this.initialValue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Get.theme.hintColor,
                fontSize: AppDimension.fontSizeDefault,
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimension.marginSmall / 2),
          child: TextFormField(
            initialValue: initialValue,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscureText,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            onEditingComplete: () {
              FocusScope.of(context).setFirstFocus(FocusScopeNode());
            },
            validator: validation,
            onChanged: onValueChanged,
            decoration: InputDecoration(
              counterText: "",
              hintText: placeHolder,
              suffixIcon: suffix,
            ),
          ),
        ),
      ],
    );
  }
}
