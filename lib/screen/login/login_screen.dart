import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/login_controller.dart';
import 'package:tajir/screen/login/local_widgets/login_action_button.dart';
import 'package:tajir/screen/login/local_widgets/login_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/simple_text_field_with_hint.dart';

import '../../theme/app_dimension.dart';
import 'local_widgets/login_welcome_title_widget.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: GetX<LoginController>(
          init: LoginController(loginFormKey: _loginFormKey),
          builder: (loginController) => CustomScrollView(
            slivers: [
              LoginAppBar(
                onBackTapped: loginController.onBackTapped,
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimension.paddingExtraLarge),
                sliver: SliverToBoxAdapter(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        const LoginWelcomeTitleWidget(),
                        SimpleTextFieldWithHint(
                          fieldName: 'email_address'.tr,
                          onValueChanged: loginController.updateMail,
                          validation: (_) => loginController.validateMail(),
                        ),
                        SimpleTextFieldWithHint(
                          fieldName: 'password'.tr,
                          obscureText: loginController.isTextObscured.value,
                          onValueChanged: loginController.updatePassword,
                          validation: (_) => loginController.validatePassword(),
                          suffix: GestureDetector(
                            onTap: () {
                              loginController.toggleObscured();
                            },
                            child: Icon(loginController.isTextObscured.value
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.context!.width / 4,
                  ),
                  child: LoginActionButton(
                    onActionTapped: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      loginController.signIn();
                    },
                    isLoading: loginController.loginResponse.value.status ==
                        Status.loading,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
