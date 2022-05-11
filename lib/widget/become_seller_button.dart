import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class BecomeSellerButton extends StatelessWidget {
  final Function()? onActionTapped;
  final ButtonStyle? buttonStyle;
  const BecomeSellerButton({Key? key, this.onActionTapped, this.buttonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onActionTapped,
      style: buttonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.people),
          Flexible(
            child: Text(
              'become_seller'.tr.toUpperCase(),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
