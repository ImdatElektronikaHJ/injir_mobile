import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitLoginBecomeSellerButton extends StatelessWidget {
  final void Function()? onBecomeSellerTapped;

  const InitLoginBecomeSellerButton({Key? key, this.onBecomeSellerTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width * 3 / 5,
      child: ElevatedButton(
        onPressed: onBecomeSellerTapped,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.people,
            ),
            Flexible(
              child: Text(
                'become_seller'.tr.toUpperCase(),
                style: AppTextStyle.avenirRegular,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        style: AppButtonStyle.elevatedButtonStyleSmall,
      ),
    );
  }
}
