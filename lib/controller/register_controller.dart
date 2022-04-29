import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/model/registration_account.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/util/validator.dart';

import '../data/network/repository/account_registration_repository.dart';

class RegisterController extends GetxController {
  RxBool isPasswordObscured = RxBool(true);
  RxBool isConfirmPasswordObscured = RxBool(true);
  RxBool isPrivacyChecked = RxBool(false);
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  Rx<StatefullData> registerResponse = Rx(StatefullData.empty());

  String? _firstName;
  String? _lastName;
  String? _mail;
  String? _phone;
  String? _password;
  String? _confirmPassword;
  final List<Map<String, String>>? _map = [];

  RegistrationAccount _registrationAccount = RegistrationAccount();
  final AccountRegistrationRepository _accountRegistrationRepository =
      AccountRegistrationRepository();

  void toggleObscured() {
    bool _isPasswordObscured = isPasswordObscured.value;
    isPasswordObscured.value = !_isPasswordObscured;
  }

  void toggleConfirmObscured() {
    bool _isConfirmPasswordObscured = isConfirmPasswordObscured.value;
    isConfirmPasswordObscured.value = !_isConfirmPasswordObscured;
  }

  void togglePrivacy() {
    bool isPrivacyChecked = this.isPrivacyChecked.value;
    this.isPrivacyChecked.value = !isPrivacyChecked;
  }

  void updateFirstName(String? value) {
    _firstName = value?.trim();
  }

  void updateLastName(String? value) {
    _lastName = value?.trim();
  }

  void updatePhone(String? value) {
    if (_map != null) {
      _map!.removeWhere((element) => element.containsKey('phone'));
    }
    _phone = value?.trim();
  }

  void updatePassword(String? value) {
    _password = value!.trim();
  }

  void updateConfirmPassword(String? value) {
    _confirmPassword = value!.trim();
  }

  void updateMail(String? value) {
    if (_map != null) {
      _map!.removeWhere((element) => element.containsKey('mail'));
    }
    _mail = value!.trim();
  }

  String? validateFirstName() {
    if (_firstName == null || _firstName!.isEmpty) {
      return 'error text';
    } else if (!Validator.matchAsciiTextWithSymbols(_firstName!)) {
      return 'spelling error';
    } else {
      return null;
    }
  }

  String? validateLastName() {
    if (_lastName == null || _lastName!.isEmpty) {
      return 'error text';
    } else if (!Validator.matchAsciiTextWithSymbols(_lastName!)) {
      return 'spelling error';
    } else {
      return null;
    }
  }

  String? validatePhone() {
    if (_phone == null || _phone!.isEmpty) {
      return 'error text';
    } else if (!Validator.matchPhoneNumber(_phone!)) {
      return 'spelling error';
    } else if (_map != null && _map!.isNotEmpty) {
      for (var element in _map!) {
        if (element.containsKey('phone')) {
          return element['phone'];
        }
      }
    } else {
      return null;
    }
    return null;
  }

  String? validateMail() {
    if (_mail == null || _mail!.isEmpty) {
      return 'error text';
    } else if (!Validator.matchEmail(_mail!)) {
      return 'spelling error';
    } else if (_map != null && _map!.isNotEmpty) {
      for (var element in _map!) {
        if (element.containsKey('mail')) {
          return element['mail'];
        }
      }
    } else {
      return null;
    }
    return null;
  }

  String? validatePassword() {
    if (_password == null || _password!.isEmpty) {
      return 'error text';
    } else if (_password!.length < 6) {
      return 'password should be longer than 6';
    } else {
      return null;
    }
  }

  String? validateConfirmPassword() {
    if (_password != null && _password!.isNotEmpty) {
      if (_confirmPassword!.trim() != _password!.trim()) {
        return 'password is not equal';
      }
    } else {
      return 'password is not equal';
    }
    return null;
  }

  void _clearAll() {
    _mail = null;
    _confirmPassword = null;
    _password = null;
    _firstName = null;
    _lastName = null;
    _password = null;
    _phone = null;
    _registrationAccount = RegistrationAccount();
  }

  void _addToRegisterModel() {
    _registrationAccount.firstName = _firstName;
    _registrationAccount.lastName = _lastName;
    _registrationAccount.telephone = _phone;
    _registrationAccount.password = _password;
    _registrationAccount.email = _mail;
  }

  void register() {
    Get.closeAllSnackbars();
    // _map = [
    // {'mail': 'mail is incorrect'},
    // {'mail': 'mail is exist'},
    // {'phone': 'phone is exist'}
    // ];
    if (!isPrivacyChecked.value) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Please check checkbox if you agree',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.darkPurpleColor,
        duration: Duration(milliseconds: 3000),
        margin: EdgeInsets.all(AppDimension.marginLarge),
        borderRadius: AppDimension.borderRadiusMedium,
        animationDuration: Duration(milliseconds: 650),
      ));
    }
    if (registerFormKey.currentState!.validate() && isPrivacyChecked.value) {
      _addToRegisterModel();
      _makeRegistration();
    }
  }

  void _makeRegistration() async {
    registerResponse.value = StatefullData.loading();
    try {
      await _accountRegistrationRepository
          .makeRegistration(_registrationAccount);
      registerResponse.value = StatefullData.completed('');
      Get.offAndToNamed(AppRoutes.dashboardRoute);
      _clearAll();
    } catch (e) {
      registerResponse.value = StatefullData.error(e);
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
