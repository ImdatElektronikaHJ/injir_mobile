import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AddNewAddressButton extends StatelessWidget {
  final Function onAddNewAddressPressed;

  const AddNewAddressButton({Key? key, required this.onAddNewAddressPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onAddNewAddressPressed();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppDimension.paddingMedium),
        margin: const EdgeInsets.symmetric(
            horizontal:
                AppDimension.marginLarge + AppDimension.marginExtraLarge * 2,
            vertical: AppDimension.paddingMedium),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.blueColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'add_address'.tr,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: AppColors.blueColor),
        ),
      ),
    );
  }
}
