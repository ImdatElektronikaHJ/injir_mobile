import 'package:flutter/material.dart';
import 'package:tajir/theme/app_button_style.dart';

import '../../theme/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  final String title;
  final Function onTapped;

  const AddToCartButton({Key? key, required this.title, required this.onTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTapped(),
      style: AppButtonStyle.elevatedButtonStyleSmall.copyWith(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.blueColor)),
      child: Text(
        title,
      ),
    );
  }
}
