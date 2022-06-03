import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/controller/edit_profile_controller.dart';
import 'package:tajir/screen/edit_profile/local_widgets/edit_profile_action_button.dart';
import 'package:tajir/screen/edit_profile/local_widgets/edit_profile_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

import '../../base/statefull_data.dart';
import '../../model/account.dart';
import '../../widget/simple_text_field_with_hint.dart';

class EditProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: GetBuilder<EditProfileController>(
        init: EditProfileController(formKey: _formKey),
        builder: (controller) {
          Account? account = controller.account;
          return CustomScrollView(
            slivers: [
              const EditProfileAppBar(),
              SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimension.paddingLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SimpleTextFieldWithHint(
                          fieldName: "first_name".tr,
                          initialValue: account.firstName,
                          validation: (_) => controller.validateFirstName(),
                          onValueChanged: (value) {
                            controller.updateFirstName(value);
                          },
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: "last_name".tr,
                          initialValue: account.lastName,
                          validation: (_) => controller.validateLastName(),
                          onValueChanged: (value) {
                            controller.updateLastName(value);
                          },
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: "email_address".tr,
                          hint: "send_confirmation".tr,
                          initialValue: account.email,
                          validation: (_) => controller.validateMail(),
                          onValueChanged: (value) {
                            controller.updateMail(value);
                          },
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: "phone_number".tr,
                          initialValue: account.phone,
                          validation: (_) => controller.validatePhone(),
                          onValueChanged: (value) {
                            controller.updatePhone(value);
                          },
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Get.width / 4),
                          child: EditScreenSaveButton(
                            onActionTapped: () {
                              controller.onSaveTapped();
                            },
                            isLoading: controller.accountResponse.status ==
                                Status.loading,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
