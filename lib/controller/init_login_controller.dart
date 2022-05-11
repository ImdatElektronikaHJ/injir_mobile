import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tajir/base/cancelable_void_future.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/data/network/repository/login_repository.dart';
import 'package:tajir/util/validator.dart';

class InitLoginController extends GetxController {
  final GlobalKey<FormState> formStateKey;

  StatefullData _loginResponse = StatefullData.empty();

  CancelableVoidFuture? _loginFuture;

  final _loginRepository = LoginRepository();

  String? email;
  String? password;

  InitLoginController({required this.formStateKey});

  void onBackTapped() {
    Get.back();
  }

  StatefullData get loginResponse => _loginResponse;

  String? validatePassword(String? _) {
    if (password == null || password!.isEmpty) {
      return 'fill_field'.tr;
    }
    return null;
  }

  String? validateEmail(String? _) {
    if (email == null || email!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchEmail(email!)) {
      return 'check_spelling'.tr;
    }
    return null;
  }

  void validateAndLogin() {
    if (formStateKey.currentState?.validate() ?? false) {
      _makeLogin();
    }
  }

  void navigateToSignUp() {
    if (_loginResponse.status != Status.loading) {
      Get.toNamed(AppRoutes.initRegistrationRoute);
    }
  }

  void navigateToBecomeSeller() {
    if (_loginResponse.status != Status.loading) {
      //TODO: ADD LOGIC HERE
    }
  }

  void _makeLogin() async {
    if (_loginResponse.status != Status.loading) {
      _loginFuture?.cancel();
      _loginResponse = StatefullData.loading();
      update();
      _loginFuture = CancelableVoidFuture(
          _loginRepository.makeLogin(email!, password!), onSuccessCallback: () {
        _loginResponse = StatefullData.completed('');
        update();
        _navigateToDashboard();
      }, onErrorCallback: (e) {
        _loginResponse = StatefullData.error(e);
        print(e);
        update();
      });
    }
  }

  void updateEmail(String? value) {
    if (value != null) {
      email = value.trim();
    } else {
      email = value;
    }
  }

  void updatePassword(String? value) {
    if (value != null) {
      password = value.trim();
    } else {
      password = value;
    }
  }

  void _navigateToDashboard() {
    Get.offAllNamed(
      AppRoutes.dashboardRoute,
    );
  }
}
