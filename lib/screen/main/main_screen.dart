import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tajir/localization/localization_service.dart';

class MainScreen extends StatelessWidget {
  final LocalizationService localizationService = LocalizationService();
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('app_name'.tr),
          ElevatedButton(
              onPressed: () => _onLangChange(LocalizationService.langs[0]),
              child: Text(LocalizationService.langs[0])),
          ElevatedButton(
              onPressed: () => _onLangChange(LocalizationService.langs[1]),
              child: Text(LocalizationService.langs[1])),
          ElevatedButton(
              onPressed: () => _onLangChange(LocalizationService.langs[2]),
              child: Text(LocalizationService.langs[2]))
        ],
      ),
    );
  }

  _onLangChange(String lang) {
    localizationService.changeLocale(lang);
  }
}
