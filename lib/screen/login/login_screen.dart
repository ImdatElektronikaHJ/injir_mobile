import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/base/stateful_data.dart';
import 'package:tajir/controller/login_controller.dart';
import 'package:tajir/screen/login/local_widgets/login_action_button.dart';
import 'package:tajir/screen/login/local_widgets/login_app_bar.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/widget/simple_text_field_with_hint.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginController(), permanent: true);
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const LoginAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: loginController.loginFormKey,
                    child: Column(
                      children: [
                        SimpleTextFieldWithHint(
                          fieldName: 'email_address'.tr,
                          onValueChanged: loginController.updateMail,
                          validation: (_) => loginController.validateMail(),
                        ),
                        Obx(
                          () => SimpleTextFieldWithHint(
                            fieldName: 'password'.tr,
                            obscureText: loginController.isTextObscured.value,
                            onValueChanged: loginController.updatePassword,
                            validation: (_) =>
                                loginController.validatePassword(),
                            suffix: GestureDetector(
                              onTap: () {
                                loginController.toggleObscured();
                              },
                              child: Icon(loginController.isTextObscured.value
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => LoginActionButton(
                      onActionTapped: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        loginController.signIn();
                      },
                      title: 'sign_in'.tr,
                      padding: Get.context!.width / 4,
                      isLoading: loginController.loginResponse.value.status ==
                          Status.loading,
                    ),
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
