import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemeService {
  final GetStorage _storage = GetStorage();
  final String _isDarkModeKey = 'is_dark_mode';

  ThemeMode get themeMode =>
      _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _storage.read(_isDarkModeKey) ?? false;

  _saveThemeToBox(bool isDarkMode) =>
      _storage.write(_isDarkModeKey, isDarkMode);

  switchTheme() {
    bool isDarkMode = _loadThemeFromBox();
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!isDarkMode);
  }
}
