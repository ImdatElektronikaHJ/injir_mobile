import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/register_controller.dart';
import 'package:tajir/screen/registration/local_widgets/registration_app_bar.dart';
import 'package:tajir/screen/registration/local_widgets/registration_become_seller_button.dart';
import 'package:tajir/screen/registration/local_widgets/registration_title.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

import 'local_widgets/registration_first_name_field.dart';
import 'local_widgets/registration_last_name_field.dart';
import 'local_widgets/registration_login_button.dart';
import 'local_widgets/registration_mail_field.dart';
import 'local_widgets/registration_password_field.dart';
import 'local_widgets/registration_phone_field.dart';
import 'local_widgets/registration_privacy_policy.dart';
import 'local_widgets/registration_register_button.dart';

class RegistrationScreen extends StatelessWidget {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: GetBuilder<RegisterController>(
          init: RegisterController(registerFormKey: registerFormKey),
          builder: (registerController) {
            bool isLoading =
                registerController.registerResponse?.status == Status.loading;
            return CustomScrollView(
              slivers: [
                RegistrationAppBar(
                  onBackTapped: registerController.onBackTapped,
                ),
                const RegistrationTitle(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Form(
                        key: registerController.registerFormKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.paddingExtraLarge,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              RegistrationFirstNameField(
                                validation: (_) =>
                                    registerController.validateFirstName(),
                                onValueChanged:
                                    registerController.updateFirstName,
                                isEnabled: !isLoading,
                              ),
                              RegistrationLastNameField(
                                validation: (_) =>
                                    registerController.validateLastName(),
                                onValueChanged:
                                    registerController.updateLastName,
                                isEnabled: !isLoading,
                              ),
                              RegistrationMailField(
                                validation: (_) =>
                                    registerController.validateMail(),
                                onValueChanged: registerController.updateMail,
                                isEnabled: !isLoading,
                              ),
                              RegistrationPhoneField(
                                validation: (_) =>
                                    registerController.validatePhone(),
                                onValueChanged: registerController.updatePhone,
                                isEnabled: !isLoading,
                              ),
                              RegistrationPasswordField(
                                isEnabled: !isLoading,
                                obscureText:
                                    registerController.isPasswordObscured,
                                onValueChanged:
                                    registerController.updatePassword,
                                validation: (_) =>
                                    registerController.validatePassword(),
                                toggleObscure:
                                    registerController.toggleObscured,
                              ),
                              RegistrationPrivacyPolicy(
                                onPrivacyTapped:
                                    registerController.onPrivacyTapped,
                                isPrivacyChecked:
                                    registerController.isPrivacyChecked,
                                togglePrivacy: (_) =>
                                    registerController.togglePrivacy(),
                              ),
                              RegistrationRegisterButton(
                                isLoading: isLoading,
                                onActionTapped: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  registerController.register();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      RegistrationLoginButton(
                        onActionTapped: registerController.onLoginTapped,
                      ),
                      RegistrationBecomeSellerButton(
                        onActionTapped: registerController.onBecomeSellerTapped,
                      ),
                      const SizedBox(
                        height: AppDimension.marginLarge,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
