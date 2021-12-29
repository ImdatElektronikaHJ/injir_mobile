import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajir/screen/registration/local_widgets/registration_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/become_seller_button.dart';
import 'package:tajir/widget/simple_text_field_with_hint.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'local_widgets/registartion_action_button.dart';
import 'local_widgets/registration_birth_date/registration_birth_day.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const RegistrationAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SimpleTextFieldWithHint(
                    fieldName: "first_name".tr,
                  ),
                  SimpleTextFieldWithHint(
                    fieldName: "last_name".tr,
                  ),
                  SimpleTextFieldWithHint(
                    fieldName: "email_address".tr,
                    hint: "send_confirmation".tr,
                  ),
                  SimpleTextFieldWithHint(
                    fieldName: "phone_number".tr,
                  ),
                  SimpleTextFieldWithHint(
                    fieldName: "password".tr,
                    obscureText: true,
                  ),
                  const RegistrationBirthDay(),
                  RegistrationActionButton(
                    onActionTapped: () {
                      print('asdasdsadsdasd');
                    },
                    title: 'create_account'.tr.toUpperCase(),
                  ),
                  RegistrationActionButton(
                    onActionTapped: () {
                      print('asdasdasdasd');
                    },
                    padding: MediaQuery.of(context).size.width / 4,
                    title: 'sign_in'.tr.toUpperCase(),
                  ),
                  BecomeSellerButton(
                    onActionTapped: () {
                      print('asdasdasd');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
