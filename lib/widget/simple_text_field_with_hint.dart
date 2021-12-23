import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/simple_text_field.dart';

class SimpleTextFieldWithHint extends StatelessWidget {
  final bool obscureText;
  final String fieldName;
  final String? hint;
  const SimpleTextFieldWithHint(
      {Key? key, this.obscureText = false, required this.fieldName, this.hint})
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
