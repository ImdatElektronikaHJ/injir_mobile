import 'package:get_storage/get_storage.dart';
import 'package:tajir/model/login.dart';

class StorageLogin {
  static const String accountPhoneKey = 'account_login';
  static const String accountPasswordKey = 'account_password';

  static Future<Login?> getLogin() async {
    GetStorage sharedPref = GetStorage();
    if (!sharedPref.hasData(accountPhoneKey) ||
        !sharedPref.hasData(accountPasswordKey)) {
      return null;
    }
    String? accountName = sharedPref.read<String>(accountPhoneKey);
    String? accountPassword = sharedPref.read<String>(accountPasswordKey);
    return Login(phoneNumber: accountName, password: accountPassword);
  }

  static Future saveNewLogin(Login login) async {
    GetStorage sharedPref = GetStorage();
    await sharedPref.write(accountPhoneKey, login.phoneNumber);
    await sharedPref.write(accountPasswordKey, login.password);
  }

  static Future clearLogin() async {
    GetStorage sharedPref = GetStorage();
    if (sharedPref.hasData(accountPhoneKey) &&
        sharedPref.hasData(accountPasswordKey)) {
      await sharedPref.remove(accountPhoneKey);
      await sharedPref.remove(accountPasswordKey);
    }
  }
}
