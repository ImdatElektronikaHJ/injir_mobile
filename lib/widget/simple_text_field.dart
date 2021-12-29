import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

class SimpleTextField extends StatelessWidget {
  final String fieldName;
  final bool obscureText;

  const SimpleTextField(
      {Key? key, required this.fieldName, required this.obscureText})
      : super(key: key);
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
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
