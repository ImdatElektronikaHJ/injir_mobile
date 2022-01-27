import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tajir/theme/app_dimension.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String fieldName;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onValueChanged;
  final String? placeHolder;

  const SimpleTextField({
    Key? key,
    required this.fieldName,
    required this.obscureText,
    this.maxLength,
    this.controller,
    this.inputFormatters,
    this.onValueChanged,
    this.placeHolder,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 14.0,
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimension.marginSmall / 2),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            onEditingComplete: () {
              FocusScope.of(context).setFirstFocus(FocusScopeNode());
            },
            onChanged: (text) {
              onValueChanged!(text);
            },
            decoration: InputDecoration(
              counterText: "",
              hintText: placeHolder,
            ),
          ),
        ),
      ],
    );
  }
}

