import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_button_style.dart';

class RegistrationBecomeSellerButton extends StatelessWidget {
  final Function()? onActionTapped;
  const RegistrationBecomeSellerButton({Key? key, this.onActionTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width * 3 / 5,
      child: ElevatedButton(
        onPressed: onActionTapped,
        style: AppButtonStyle.elevatedButtonStyleSmall,
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
      ),
    );
  }
}
