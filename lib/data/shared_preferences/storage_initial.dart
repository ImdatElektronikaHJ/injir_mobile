import 'package:get_storage/get_storage.dart';

class StorageInitial {
  static const String isFirstOpenKey = 'is_first_open';

  static Future<bool> isFirstOpen() async {
    GetStorage sharedPref = GetStorage();
    if (!sharedPref.hasData(isFirstOpenKey)) {
      return true;
    }
    bool? isFirstOpened = sharedPref.read<bool>(isFirstOpenKey);
    return isFirstOpened ?? true;
  }

  static Future updateFirstOpen() async {
    GetStorage sharedPref = GetStorage();
    await sharedPref.write(isFirstOpenKey, false);
  }
}
