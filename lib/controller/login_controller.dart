import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/const/app_routes.dart';
import 'package:tajir/model/login.dart';
import 'package:tajir/util/validator.dart';

class LoginController extends GetxController {
  RxBool isTextObscured = RxBool(true);

  

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final Login _login = Login();

  Rx<StatefullData> loginResponse = Rx<StatefullData>(StatefullData.empty());

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
      return 'error text';
    } else if (!Validator.matchEmail(_mail!)) {
      return 'spelling error';
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
      return 'error text';
    } else if (_password!.length < 6) {
      return 'password should be longer than 6';
    } else if (_map.isNotEmpty) {
      for (var element in _map) {
        if (element.containsKey('password')) {
          return element['password'];
        }
      }
    } else {
      return null;
    }
    return null;
  }

  void _clearAll() {
    _mail = null;
    _password = null;
    loginFormKey.currentState!.reset();
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
      loginResponse.value = StatefullData.loading();
      await Future.delayed(const Duration(milliseconds: 2000));
      loginResponse.value = StatefullData.completed('');
      Get.offAndToNamed(AppRoutes.dashboardRoute);
      _clearAll();
    }
  }
}
