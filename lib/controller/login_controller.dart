import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/data/network/api_exception.dart';
import 'package:tajir/model/login.dart';
import 'package:tajir/theme/app_dimension.dart';
import 'package:tajir/util/validator.dart';

import '../base/cancelable_void_future.dart';
import '../data/network/repository/login_repository.dart';
import '../theme/app_colors.dart';
import '../util/interpolation_util.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey;
  LoginController({required this.loginFormKey});

  RxBool isTextObscured = RxBool(true);

  final Login _login = Login();

  CancelableVoidFuture? _loginFuture;

  final _loginRepository = LoginRepository();

  final Rx<StatefullData> _loginResponse =
      Rx<StatefullData>(StatefullData.empty());

  Rx<StatefullData> get loginResponse => _loginResponse;

  String? _mail;
  String? _password;
  List<Map<String, String>> _map = [];

  void updateMail(String? value) {
    _map.removeWhere((element) => element.containsKey('mail'));
    _mail = value!.trim();
    _login.phoneNumber = _mail;
  }

  void updatePassword(String? value) {
    _map.removeWhere((element) => element.containsKey('phone'));
    _password = value!.trim();
    // _login.password = _password;
  }

  void toggleObscured() {
    bool _isTextObscured = isTextObscured.value;
    isTextObscured.value = !_isTextObscured;
  }

  String? validateMail() {
    if (_mail == null || _mail!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchEmail(_mail!)) {
      return 'check_spelling'.tr;
    } else if (_map.isNotEmpty) {
      for (var element in _map) {
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
      return 'fill_field'.tr;
    } else if (_password!.length < 6) {
      return InterpolationUtil.interpolate('field_min_length'.tr, [6]);
    } else {
      return null;
    }
  }

  void _clearAll() {
    _mail = null;
    _password = null;
    loginFormKey.currentState!.reset();
  }

  void onBackTapped() {
    Get.back();
  }

  void signIn() async {
    // _map = [
    //   {
    //     // 'mail': 'mail is exist',
    //     'mail': 'mail is incorrect',
    //     'phone': 'phone is incorrect',
    //     'password': 'password is incorrect'
    //   },
    // ];
    if (loginFormKey.currentState!.validate()) {
      if (_loginResponse.value.status != Status.loading) {
        _loginFuture?.cancel();
        _loginResponse.value = StatefullData.loading();
        update();
        _loginFuture = CancelableVoidFuture(
          _loginRepository.makeLogin(_mail!, _password!),
          onSuccessCallback: () {
            _loginResponse.value = StatefullData.completed('');
            update();
            // _navigateToDashboard();
            _clearAll();
          },
          onErrorCallback: (e) {
            _loginResponse.value = StatefullData.error(e);
            Get.closeCurrentSnackbar();
            Get.closeAllSnackbars();
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
                  _loginResponse.value.error.message['error'][0] ?? '',
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
              print('Login controller signIn method: $e');
            }
            update();
          },
        );
      }
    }
  }
}
