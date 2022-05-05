import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tajir/base/cancelable_void_future.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/data/network/repository/account_registration_repository.dart';
import 'package:tajir/model/registration_account.dart';
import 'package:tajir/util/interpolation_util.dart';
import 'package:tajir/util/validator.dart';

class InitRegistrationController extends GetxController {
  final _accountRegistrationRepository = AccountRegistrationRepository();

  final GlobalKey<FormState> registrationFormKey;

  var registrationResponse = StatefullData.empty();

  var account = RegistrationAccount();

  bool _isPasswordObscured = true;

  CancelableVoidFuture? _registrationFuture;

  bool _privacyPolicyChecked = false;

  InitRegistrationController({required this.registrationFormKey});

  bool get isPasswordObscured => _isPasswordObscured;

  bool get formsEnabled => registrationResponse.status != Status.loading;

  bool get privacyPolicyChecked => _privacyPolicyChecked;

  String? validateFirstName(String? name) {
    if (account.firstName == null || account.firstName!.isEmpty) {
      return 'fill_field'.tr;
    } else if (account.firstName!.length < 2 ||
        account.firstName!.length > 96) {
      return InterpolationUtil.interpolate('field_max_min_length'.tr, [2, 96]);
    }
    return null;
  }

  void toggleObscured() {
    if (formsEnabled) {
      bool isPasswordObscured = _isPasswordObscured;
      _isPasswordObscured = !isPasswordObscured;
      update();
    }
  }

  void togglePrivacyPolicyCheckStatus() {
    if (formsEnabled) {
      bool isPrivacyPolicyChecked = _privacyPolicyChecked;
      _privacyPolicyChecked = !isPrivacyPolicyChecked;
      update();
    }
  }

  void navigateToPrivacyPolicyInfo() {
    //TODO: ADD LOGIC HERE
  }

  void updateFirstName(String? name) {
    account.firstName = name?.trim();
  }

  String? validateLastName(String? lastname) {
    if (account.lastName == null || account.lastName!.isEmpty) {
      return 'fill_field'.tr;
    } else if (account.lastName!.length < 2 || account.lastName!.length > 96) {
      print(InterpolationUtil.interpolate('field_max_min_length'.tr, [2, 96]));
      return InterpolationUtil.interpolate('field_max_min_length'.tr, [2, 96]);
    }
    return null;
  }

  void updateLastName(String? lastname) {
    account.lastName = lastname?.trim();
  }

  String? validateEmail(String? email) {
    if (account.email == null || account.email!.isEmpty) {
      return null;
    } else if (!Validator.matchEmail(account.email!)) {
      return 'check_spelling'.tr;
    }
    return null;
  }

  void updateEmail(String? email) {
    account.email = email?.trim();
  }

  String? validatePhone(String? phone) {
    if (account.phone == null || account.phone!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchPhoneNumber(account.phone!)) {
      return 'check_spelling'.tr;
    }
    return null;
  }

  void updatePhone(String? phone) {
    account.phone = phone?.trim();
  }

  String? validatePassword(String? password) {
    if (account.password == null || account.password!.isEmpty) {
      return 'fill_field'.tr;
    }
    return null;
  }

  void updatePassword(String? password) {
    account.password = password?.trim();
  }

  void validateAndSignUp() {
    if (registrationFormKey.currentState?.validate() == true &&
        registrationResponse.status != Status.loading) {
      _makeRegistration();
    }
  }

  void _makeRegistration() {
    _registrationFuture?.cancel();
    registrationResponse.status = Status.loading;
    update();
    _registrationFuture = CancelableVoidFuture(
        _accountRegistrationRepository.makeRegistration(account),
        onSuccessCallback: () {
      registrationResponse = StatefullData.completed('');
      update();
      //TODO: ADD LOGIC HERE! Add navigate to forgot password!
    }, onErrorCallback: (e) {
      registrationResponse = StatefullData.error(e);
      update();
      //TODO: ADD LOGIC HERE! Show error snack!
    });
  }

  void onBackTapped() {
    Get.back();
  }

  void navigateToSignIn() {
    if (registrationResponse.status != Status.loading) {
      Get.offAndToNamed(AppRoutes.initLoginRoute);
    }
  }

  void navigateToBecomeSeller() {
    if (registrationResponse.status != Status.loading) {
      //TODO: ADD LOGIC HERE!
    }
  }
}
