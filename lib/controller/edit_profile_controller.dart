import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/data/network/repository/account_repository.dart';
import 'package:tajir/model/account.dart';
import 'package:tajir/theme/app_text_style.dart';

import '../data/network/api_exception.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimension.dart';
import '../util/validator.dart';

class EditProfileController extends GetxController {
  final _accountController = Get.find<AccountController>();

  final GlobalKey<FormState> formKey;
  EditProfileController({required this.formKey}) {
    _accountUpdateRepository = AccountRepository();
  }

  StatefullData _accountUpdateResponse = StatefullData.empty();
  StatefullData get accountResponse => _accountUpdateResponse;

  Account _account = Account.dummy();
  Account _updatingAccount = Account.dummy();
  Account get account => _updatingAccount;
  StreamSubscription? _updateResponseSubscription;

  late final AccountRepository _accountUpdateRepository;

  void _getAccount() async {
    final status = _accountController.accountResponse.status;
    final initialAccount = _accountController.accountResponse.data!;
    if (status == Status.completed) {
      _updatingAccount = Account.fromJson(initialAccount.toJson());
      _account = initialAccount;
      update();
    }
  }

  void updateFirstName(String value) {
    _updatingAccount.firstName = value;
    update();
  }

  void updateLastName(String value) {
    _updatingAccount.lastName = value;
    update();
  }

  void updateMail(String value) {
    _updatingAccount.email = value;
    update();
  }

  void updatePhone(String value) {
    _updatingAccount.phone = value;
    update();
  }

  String? validateFirstName() {
    if (_updatingAccount.firstName == null ||
        _updatingAccount.firstName!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchAsciiTextWithSymbols(
        _updatingAccount.firstName!)) {
      return 'check_spelling'.tr;
    } else {
      return null;
    }
  }

  String? validateLastName() {
    if (_updatingAccount.lastName == null ||
        _updatingAccount.lastName!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchAsciiTextWithSymbols(
        _updatingAccount.lastName!)) {
      return 'check_spelling'.tr;
    } else {
      return null;
    }
  }

  String? validatePhone() {
    if (_updatingAccount.phone == null || _updatingAccount.phone!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchPhoneNumber(_updatingAccount.phone!)) {
      return 'check_spelling'.tr;
    }
    return null;
  }

  String? validateMail() {
    if (_updatingAccount.email == null || _updatingAccount.email!.isEmpty) {
      return 'fill_field'.tr;
    } else if (!Validator.matchEmail(_updatingAccount.email!)) {
      return 'check_spelling'.tr;
    }
    return null;
  }

  Future<Map<String, String>> _getUpdatedFields() async {
    Map<String, String> updatedFields = {};
    if (_account.firstName != _updatingAccount.firstName) {
      updatedFields['firstname'] = _updatingAccount.firstName!;
    }
    if (_account.lastName != _updatingAccount.lastName) {
      updatedFields['lastname'] = _updatingAccount.lastName!;
    }
    if (_account.email != _updatingAccount.email) {
      updatedFields['email'] = _updatingAccount.email!;
    }
    if (_account.phone != _updatingAccount.phone) {
      updatedFields['telephone'] = _updatingAccount.phone!;
    }
    return updatedFields;
  }

  void onSaveTapped() async {
    if (formKey.currentState!.validate()) {
      final updatedFields = await _getUpdatedFields();
      if (updatedFields.isEmpty) {
        Get.closeCurrentSnackbar();
        Get.showSnackbar(GetSnackBar(
          messageText: Text(
            'nothing_changed'.tr,
            style:
                AppTextStyle.avenirBold.copyWith(color: AppColors.whiteColor),
          ),
          duration: const Duration(milliseconds: 3500),
          margin: const EdgeInsets.all(AppDimension.marginMedium),
          backgroundColor: AppColors.lightRedColor,
          borderRadius: AppDimension.borderRadiusMedium,
        ));
      } else {
        _updateAccount(updatedFields);
      }
    }
  }

  void _updateAccount(Map<String, String> updatedFields) async {
    if (_updateResponseSubscription != null) {
      _updateResponseSubscription!.cancel();
    }
    if (_accountUpdateResponse.status != Status.loading) {
      _accountUpdateResponse = StatefullData.loading();
      update();
    }
    _updateResponseSubscription = _accountUpdateRepository
        .updateAccount(updatedFields)
        .asStream()
        .listen((data) {
      _accountUpdateResponse = StatefullData.completed(data);
      _accountController.onAccountUpdate(_updatingAccount);
      Get.closeCurrentSnackbar();
      Get.showSnackbar(GetSnackBar(
        messageText: Text(
          'saved'.tr,
          style: AppTextStyle.avenirBold.copyWith(color: AppColors.whiteColor),
        ),
        duration: const Duration(milliseconds: 3500),
        margin: const EdgeInsets.all(AppDimension.marginMedium),
        backgroundColor: AppColors.greenColor,
        borderRadius: AppDimension.borderRadiusMedium,
      ));
      update();
    }, onError: (e) {
      if (kDebugMode) {
        print('Account update provider: $e');
      }
      _accountUpdateResponse = StatefullData.error(e);
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
            _accountUpdateResponse.error.message['error'][0] ?? '',
            style:
                Get.textTheme.subtitle1!.copyWith(color: AppColors.whiteColor),
          ),
          duration: const Duration(milliseconds: 4500),
          margin: const EdgeInsets.all(AppDimension.marginMedium),
          backgroundColor: AppColors.redColor,
          borderRadius: AppDimension.borderRadiusMedium,
        ));
      }
    }, onDone: () {}, cancelOnError: true);
  }

  @override
  void onInit() {
    _getAccount();
    super.onInit();
  }
}
