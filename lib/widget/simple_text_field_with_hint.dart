import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/simple_text_field.dart';

class SimpleTextFieldWithHint extends StatelessWidget {
  final bool obscureText;
  final String fieldName;
  final String? hint;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onValueChanged;
  final String? placeHolder;
  const SimpleTextFieldWithHint(
      {Key? key,
      this.obscureText = false,
      required this.fieldName,
      this.hint,
      this.maxLength,
      this.controller,
      this.inputFormatters,
      this.onValueChanged,
      this.placeHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.paddingMedium,
          vertical: AppDimension.paddingSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleTextField(
            fieldName: fieldName,
            obscureText: obscureText,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            controller: controller,
            onValueChanged: onValueChanged,
            placeHolder: placeHolder,
          ),
          Visibility(
            visible: hint != null,
            child: Text(
              '$hint',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
