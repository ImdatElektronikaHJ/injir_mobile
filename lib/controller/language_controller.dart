import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tajir/localization/localization_service.dart';

class LanguageController extends GetxController {
  final LocalizationService localizationService = LocalizationService();
  final Rx<Locale> _selectedLocale = const Locale('ru').obs;

  Rx<Locale> get selectedLocale => _selectedLocale;

  late RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    _selectedLocale.value = localizationService.getLocale();
    currentIndex.value =
        LocalizationService.availableLocales.indexOf(_selectedLocale.value);
    super.onInit();
  }

  void changeLanguage(String lang) {
    localizationService.changeLocale(lang);
    _selectedLocale.value = localizationService.getLocale();
    currentIndex.value =
        LocalizationService.availableLocales.indexOf(_selectedLocale.value);
  }
}
