import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/screen/edit_profile/local_widgets/edit_profile_action_button.dart';
import 'package:tajir/screen/edit_profile/local_widgets/edit_profile_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/simple_text_field_with_hint.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: CustomScrollView(
        slivers: [
          const EditProfileAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SimpleTextFieldWithHint(
                //   fieldName: "first_name".tr,
                // ),
                // SimpleTextFieldWithHint(
                //   fieldName: "last_name".tr,
                // ),
                // SimpleTextFieldWithHint(
                //   fieldName: "email_address".tr,
                //   hint: "send_confirmation".tr,
                // ),
                // SimpleTextFieldWithHint(
                //   fieldName: "Date of birth".tr,
                // ),
                // SimpleTextFieldWithHint(
                //   fieldName: "Gender".tr,
                // ),
                // SimpleTextFieldWithHint(
                //   fieldName: "phone_number".tr,
                // ),
                EditProfileActionButton(
                  onActionTapped: () {},
                  title: 'save'.tr.toUpperCase(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
