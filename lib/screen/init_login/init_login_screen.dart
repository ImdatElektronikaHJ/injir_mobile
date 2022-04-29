import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/controller/init_login_controller.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_app_bar.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_become_seller_button.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_emal_field.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_login_button.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_password_field.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_sign_up_button.dart';
import 'package:tajir/screen/init_login/local_widget/init_login_welcome_title_widget.dart';
import 'package:tajir/theme/app_button_style.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/theme/app_text_style.dart';

class InitLoginScreen extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  InitLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: SafeArea(
        child: GetBuilder<InitLoginController>(
            init: InitLoginController(formStateKey: _loginFormKey),
            builder: (initLoginController) {
              return CustomScrollView(
                slivers: [
                  InitLoginAppBar(
                    onBackTapped: initLoginController.onBackTapped,
                  ),
                  SliverToBoxAdapter(
                    child: Form(
                      key: _loginFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimension.paddingExtraLarge),
                        child: Column(
                          children: [
                            const InitLoginWelcomeTitleWidget(),
                            InitLoginEmailField(
                              validator: initLoginController.validateEmail,
                            ),
                            InitLoginPasswordField(
                              validator: initLoginController.validatePassword,
                            ),
                            InitLoginLoginButton(
                              onLoginTapped:
                                  initLoginController.validateAndLogin,
                            ),
                            SizedBox(
                              height: Get.size.height / 10,
                            ),
                            InitLoginSignUpButton(
                              onSingUpTapped:
                                  initLoginController.navigateToSignUp,
                            ),
                            InitLoginBecomeSellerButton(
                              onBecomeSellerTapped:
                                  initLoginController.navigateToBecomeSeller,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
