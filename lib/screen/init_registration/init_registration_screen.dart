import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/init_registration_controller.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_app_bar.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_become_seller_button.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_create_button.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_email_field.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_firstname_field.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_lastname_field.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_password_field.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_phone_field.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_sign_in_button.dart';
import 'package:tajir/screen/init_registration/local_widget/init_registration_title_widget.dart';
import 'package:tajir/theme/app_dimension.dart';

class InitRegistrationScreen extends StatelessWidget {
  final _registrationFormKey = GlobalKey<FormState>();
  InitRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: SafeArea(
        child: GetBuilder<InitRegistrationController>(
            init: InitRegistrationController(
                registrationFormKey: _registrationFormKey),
            builder: (registrationController) {
              return CustomScrollView(
                slivers: [
                  InitRegistrationAppBar(
                    onBackTapped: registrationController.onBackTapped,
                  ),
                  SliverToBoxAdapter(
                    child: Form(
                      key: _registrationFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.paddingExtraLarge),
                        child: Column(
                          children: [
                            const InitRegistrationTitleWidget(),
                            InitRegistrationFirstnameField(
                              isEnabled: registrationController.formsEnabled,
                              validator:
                                  registrationController.validateFirstName,
                              onNameUpdated:
                                  registrationController.updateFirstName,
                            ),
                            InitRegistrationLastnameField(
                              isEnabled: registrationController.formsEnabled,
                              validator:
                                  registrationController.validateLastName,
                              onLastNameUpdated:
                                  registrationController.updateLastName,
                            ),
                            InitRegistrationEmailField(
                              isEnabled: registrationController.formsEnabled,
                              validator: registrationController.validateEmail,
                              onEmailUpdated:
                                  registrationController.updateEmail,
                            ),
                            InitRegistrationPhoneField(
                              isEnabled: registrationController.formsEnabled,
                              validator: registrationController.validatePhone,
                              onPhoneUpdated:
                                  registrationController.updatePhone,
                            ),
                            InitRegistrationPasswordField(
                              isEnabled: registrationController.formsEnabled,
                              isObscured:
                                  registrationController.isPasswordObscured,
                              toggleVisibility:
                                  registrationController.toggleObscured,
                              validator:
                                  registrationController.validatePassword,
                              onPasswordUpdated:
                                  registrationController.updatePassword,
                            ),
                            //TODO: Add privacy policy here
                            const SizedBox(
                              height: AppDimension.paddingMedium,
                            ),
                            InitRegistrationCreateButton(
                              isLoading: registrationController
                                      .registrationResponse.status ==
                                  Status.loading,
                              onCreateTapped: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                registrationController.validateAndSignUp();
                              },
                            ),
                            const SizedBox(
                              height: AppDimension.paddingMedium,
                            ),
                            InitRegistrationSignInButton(
                              onSingInTapped:
                                  registrationController.navigateToSignIn,
                            ),
                            InitRegistrationBecomeSellerButton(
                              onBecomeSellerTapped:
                                  registrationController.navigateToBecomeSeller,
                            ),
                            SizedBox(
                              height: Get.size.height / 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
