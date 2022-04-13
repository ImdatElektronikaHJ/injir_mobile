import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/controller/register_controller.dart';
import 'package:tajir/screen/registration/local_widgets/registration_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/widget/become_seller_button.dart';

import '../../widget/simple_text_field_with_hint.dart';
import 'local_widgets/registartion_action_button.dart';

class RegistrationScreen extends StatelessWidget {
  final registerController = Get.put(RegisterController(), permanent: true);
  RegistrationScreen({Key? key}) : super(key: key);

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
                  Form(
                    key: registerController.registerFormKey,
                    child: Column(
                      children: [
                        SimpleTextFieldWithHint(
                          fieldName: "first_name".tr,
                          onValueChanged: registerController.updateFirstName,
                          validation: (_) =>
                              registerController.validateFirstName(),
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: "last_name".tr,
                          onValueChanged: registerController.updateLastName,
                          validation: (_) =>
                              registerController.validateLastName(),
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: "email_address".tr,
                          hint: "send_confirmation".tr,
                          onValueChanged: registerController.updateMail,
                          validation: (_) => registerController.validateMail(),
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: "phone_number".tr,
                          onValueChanged: registerController.updatePhone,
                          validation: (_) => registerController.validatePhone(),
                        ),
                        Obx(
                          () => SimpleTextFieldWithHint(
                            fieldName: "password".tr,
                            obscureText:
                                registerController.isPasswordObscured.value,
                            onValueChanged: registerController.updatePassword,
                            validation: (_) =>
                                registerController.validatePassword(),
                            suffix: GestureDetector(
                              onTap: () {
                                registerController.toggleObscured();
                              },
                              child: Icon(
                                  registerController.isPasswordObscured.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash),
                            ),
                          ),
                        ),
                        Obx(
                          () => SimpleTextFieldWithHint(
                            fieldName: "password_confirm".tr,
                            obscureText: registerController
                                .isConfirmPasswordObscured.value,
                            onValueChanged:
                                registerController.updateConfirmPassword,
                            validation: (_) =>
                                registerController.validateConfirmPassword(),
                            suffix: GestureDetector(
                              onTap: () {
                                registerController.toggleConfirmObscured();
                              },
                              child: Icon(registerController
                                      .isConfirmPasswordObscured.value
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash),
                            ),
                          ),
                        ),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimension.paddingLarge,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('I agree with '),
                                GestureDetector(
                                    onTap: () {
                                      print('Privacy policy');
                                    },
                                    child: Text(
                                      'Privacy Policy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            color: AppColors.blueColor,
                                          ),
                                    )),
                                Checkbox(
                                  value:
                                      registerController.isPrivacyChecked.value,
                                  onChanged: (_) =>
                                      registerController.togglePrivacy(),
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
                            ),
                          ),
                        ),
                        RegistrationActionButton(
                          onActionTapped: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            registerController.register();
                          },
                          title: 'create_account'.tr.toUpperCase(),
                        ),
                      ],
                    ),
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
