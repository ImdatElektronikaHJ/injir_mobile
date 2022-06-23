import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tajir/controller/account_login_status_controller.dart';
import 'package:tajir/model/account.dart';

import '../base/statefull_data.dart';
import '../data/network/repository/account_repository.dart';
import '../data/shared_preferences/storage_login.dart';

class AccountController extends GetxController {
  StatefullData<Account> _accountResponse = StatefullData.empty();
  StatefullData<Account> get accountResponse => _accountResponse;
  final _accountRepository = AccountRepository();
  StatefullData<dynamic> _logoutResponse = StatefullData.empty();
  final _accountLoginController =
      Get.put(AccountLoginStatusController(), permanent: true);

  void fetchAccount() async {
    _accountResponse = StatefullData.loading();
    update();
    _accountLoginController.getAccountStatus(_accountResponse);
    try {
      final response = await _accountRepository.getAccount();
      _accountResponse = StatefullData.completed(response);
      update();
    } catch (e) {
      _accountResponse = StatefullData.error(e);
      update();
      if (kDebugMode) {
        print(e);
      }
    }
    _accountLoginController.getAccountStatus(_accountResponse);
  }

  void onAccountUpdate(Account account) {
    _accountResponse = StatefullData.completed(account);
  }

  Future<bool> _makeLogout() async {
    _logoutResponse = StatefullData.loading();
    update();
    try {
      final response = await _accountRepository.logout();
      _logoutResponse = StatefullData.completed(response);
      update();
      return true;
    } catch (e) {
      _logoutResponse = StatefullData.error(e);
      update();
      return false;
    }
  }

  void logout() async {
    _accountResponse = StatefullData.loading();
    update();
    try {
      final bool isLoggedOut = await _makeLogout();
      if (_logoutResponse.status == Status.completed && isLoggedOut) {
        await StorageLogin.clearLogin();
        Account account = await _accountRepository.getAccount();
        _accountResponse = StatefullData.completed(account);
        update();
      }
    } catch (e) {
      _accountResponse = StatefullData.error(e);
      if (kDebugMode) {
        print('Account controller logout method: $e');
      }
      update();
    }
    _accountLoginController.getAccountStatus(_accountResponse);
  }

  @override
  void onInit() {
    fetchAccount();
    super.onInit();
  }
}
