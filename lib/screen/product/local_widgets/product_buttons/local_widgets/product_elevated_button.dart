import 'package:flutter/material.dart';
import 'package:tajir/theme/app_dimension.dart';

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
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        minimumSize: Size(MediaQuery.of(context).size.width,
            AppDimension.productElevatedButtonHeight),
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppDimension.borderRadiusSmall,
            ),
          ),
        ),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
