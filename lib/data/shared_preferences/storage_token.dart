import 'package:get_storage/get_storage.dart';

class StorageToken {
  static const String apiTokenKey = 'api_token_key';
  static const String apiTokenExpireTimeStamp = 'api_token_time_stamp';

  static Future<String?> getAccessToken() async {
    GetStorage sharedPref = GetStorage();
    return sharedPref.read<String>(apiTokenKey);
  }

  static Future<void> clearToken() async {
    GetStorage sharedPref = GetStorage();
    if (sharedPref.hasData(apiTokenKey)) {
      await sharedPref.remove(apiTokenKey);
    }
  }

  static Future<void> saveNewAccessToken(String token) async {
    GetStorage sharedPref = GetStorage();
    await sharedPref.write(apiTokenKey, token);
  }
}
