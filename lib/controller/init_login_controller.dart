import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InitLoginController extends GetxController {
  late GlobalKey<FormState> formStateKey;

  InitLoginController({required this.formStateKey});

  void onBackTapped() {
    Get.back();
  }

  String? validatePassword(String? value) {
  }

  String? validateEmail(String? value) {
  }

  void validateAndLogin() {
  }

  void navigateToSignUp() {
  }

  void navigateToBecomeSeller() {
  }
}
