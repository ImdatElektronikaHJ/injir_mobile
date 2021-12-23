import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/theme/app_dimension.dart';

class BecomeSellerButton extends StatelessWidget {
  final Function()? onActionTapped;
  const BecomeSellerButton({Key? key, this.onActionTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.shortestSide;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 4, vertical: AppDimension.paddingSmall / 2),
      child: ElevatedButton(
        onPressed: onActionTapped,
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
