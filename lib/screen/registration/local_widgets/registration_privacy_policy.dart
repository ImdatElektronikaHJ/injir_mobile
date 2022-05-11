import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class RegistrationPrivacyPolicy extends StatelessWidget {
  final Function()? onPrivacyTapped;
  final bool? isPrivacyChecked;
  final void Function(bool?)? togglePrivacy;
  const RegistrationPrivacyPolicy(
      {Key? key,
      this.onPrivacyTapped,
      this.isPrivacyChecked,
      this.togglePrivacy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        Text("agree_with".tr),
        GestureDetector(
            onTap: onPrivacyTapped,
            child: Text(
              'privacy_policy'.tr,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColors.blueColor,
                  ),
            )),
        Checkbox(
          value: isPrivacyChecked,
          onChanged: togglePrivacy,
          side: const BorderSide(
            color: AppColors.greyColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimension.borderRadiusMicro,
            ),
          ),
        ),
      ],
    );
  }
}
