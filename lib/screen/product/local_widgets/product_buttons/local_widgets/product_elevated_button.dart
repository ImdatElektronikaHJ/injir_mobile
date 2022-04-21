import 'package:flutter/material.dart';
import 'package:tajir/theme/app_button_style.dart';

class ProductElevatedButton extends StatelessWidget {
  final String title;
  final Function onTapped;
  final Color? buttonColor;

  const ProductElevatedButton(
      {Key? key, required this.title, required this.onTapped, this.buttonColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTapped(),
      style: AppButtonStyle.elevatedButtonStyleLarge.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor!)),
      child: Text(
        title,
      ),
    );
  }
}
