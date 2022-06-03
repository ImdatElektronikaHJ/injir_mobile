import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:tajir/base/cancelable_void_future.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/controller/account_login_status_controller.dart';
import 'package:tajir/model/registration_account.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/util/interpolation_util.dart';
import 'package:tajir/util/validator.dart';

import '../data/network/api_exception.dart';
import '../data/network/repository/account_registration_repository.dart';

class RegisterController extends GetxController {
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  bool isPrivacyChecked = false;
  final GlobalKey<FormState> registerFormKey;
  StatefullData _registerResponse = StatefullData.empty();

  CancelableVoidFuture? _cancelableVoidFuture;

  RegisterController({required this.registerFormKey});

  StatefullData? get registerResponse => _registerResponse;

  final List<Map<String, String>>? _map = [];

  RegistrationAccount _registrationAccount = RegistrationAccount();
  final _accountRegistrationRepository = AccountRegistrationRepository();
  final accountLoginStatusController = Get.find<AccountLoginStatusController>();
  final accountController = Get.find<AccountController>();

  void toggleObscured() {
    bool _isPasswordObscured = isPasswordObscured;
    isPasswordObscured = !_isPasswordObscured;
    update();
  }

  void toggleConfirmObscured() {
    bool _isConfirmPasswordObscured = isConfirmPasswordObscured;
    isConfirmPasswordObscured = !_isConfirmPasswordObscured;
    update();
  }

  void togglePrivacy() {
    bool isPrivacyChecked = this.isPrivacyChecked;
    this.isPrivacyChecked = !isPrivacyChecked;
    update();
  }

  void updateFirstName(String? value) {
    _registrationAccount.firstName = value?.trim();
  }

  void updateLastName(String? value) {
    _registrationAccount.lastName = value?.trim();
  }

  void updatePhone(String? value) {
    if (_map != null) {
      _map!.removeWhere((element) => element.containsKey('phone'));
    }
    _registrationAccount.telephone = value?.trim();
  }

  void updatePassword(String? value) {
    _registrationAccount.password = value!.trim();
  }

  // void updateConfirmPassword(String? value) {
  //   _confirmPassword = value!.trim();
  // }

  void updateMail(String? value) {
    if (_map != null) {
      _map!.removeWhere((element) => element.containsKey('mail'));
    }
    _registrationAccount.email = value!.trim();
  }

  String? validateFirstName() {
    if (_registrationAccount.firstName == null ||
        _registrationAccount.firstName!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchAsciiTextWithSymbols(
        _registrationAccount.firstName!)) {
      return 'check_spelling'.tr;
    } else {
      return null;
    }
  }

  String? validateLastName() {
    if (_registrationAccount.lastName == null ||
        _registrationAccount.lastName!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchAsciiTextWithSymbols(
        _registrationAccount.lastName!)) {
      return 'check_spelling'.tr;
    } else {
      return null;
    }
  }

  String? validatePhone() {
    if (_registrationAccount.telephone == null ||
        _registrationAccount.telephone!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchPhoneNumber(_registrationAccount.telephone!)) {
      return 'check_spelling'.tr;
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
    if (_registrationAccount.email == null ||
        _registrationAccount.email!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchEmail(_registrationAccount.email!)) {
      return 'check_spelling'.tr;
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
    if (_registrationAccount.password == null ||
        _registrationAccount.password!.isEmpty) {
      return 'fill_field'.tr;
    } else if (_registrationAccount.password!.length < 6) {
      return InterpolationUtil.interpolate('field_min_length'.tr, [6]);
    } else {
      return null;
    }
  }

  void _clearAll() {
    _registrationAccount = RegistrationAccount();
  }

  void register() {
    Get.closeAllSnackbars();
    if (!isPrivacyChecked) {
      _showDialog();
    }
    if (registerFormKey.currentState!.validate() && isPrivacyChecked) {
      _makeRegistration();
    }
  }

  void _showDialog() {
    Get.showSnackbar(GetSnackBar(
      message: 'check_checkbox'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.darkPurpleColor,
      duration: const Duration(milliseconds: 3000),
      margin: const EdgeInsets.all(AppDimension.marginLarge),
      borderRadius: AppDimension.borderRadiusMedium,
      animationDuration: const Duration(milliseconds: 650),
    ));
  }

  void _makeRegistration() async {
    if (_registerResponse.status != Status.loading) {
      _cancelableVoidFuture?.cancel();
      _registerResponse = StatefullData.loading();
      update();
      _cancelableVoidFuture = CancelableVoidFuture(
        _accountRegistrationRepository.makeRegistration(_registrationAccount),
        onSuccessCallback: () {
          _registerResponse = StatefullData.completed('');
          _clearAll();
          update();
          accountController.fetchAccount();
          accountLoginStatusController.getAccountStatus(_registerResponse);
          Get.offAndToNamed(AppRoutes.dashboardRoute);
        },
        onErrorCallback: (e) {
          _registerResponse = StatefullData.error(e);
          update();
          Get.closeCurrentSnackbar();
          if (e is FetchDataException) {
            Get.showSnackbar(GetSnackBar(
              title: 'network_error'.tr,
              message: 'check_internet_connection'.tr,
              duration: const Duration(milliseconds: 4500),
              margin: const EdgeInsets.all(AppDimension.marginMedium),
              backgroundColor: AppColors.redColor,
              borderRadius: AppDimension.borderRadiusMedium,
            ));
          } else {
            Get.showSnackbar(GetSnackBar(
              messageText: Text(
                _registerResponse.error.message['error'][0] ?? '',
                style: Get.textTheme.subtitle1!
                    .copyWith(color: AppColors.whiteColor),
              ),
              duration: const Duration(milliseconds: 4500),
              margin: const EdgeInsets.all(AppDimension.marginMedium),
              backgroundColor: AppColors.redColor,
              borderRadius: AppDimension.borderRadiusMedium,
            ));
          }
          if (kDebugMode) {
            print(e);
          }
        },
      );
    }
  }

  void onBackTapped() {
    Get.back();
  }

  void onBecomeSellerTapped() {
    if (_registerResponse.status != Status.loading) {
      //TODO: Add logic here
    }
  }

  void onLoginTapped() {
    if (_registerResponse.status != Status.loading) {
      //TODO: Add logic here
    }
  }

  void onPrivacyTapped() {
    if (_registerResponse.status != Status.loading) {
      //TODO: Add logic here
    }
  }
}
