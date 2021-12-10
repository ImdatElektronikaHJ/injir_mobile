import 'dart:convert';

class AuthHeaderUtil {
  static const String authorizationHeader = 'Authorization';
  static final AuthHeaderUtil _singleton = AuthHeaderUtil();

  static AuthHeaderUtil get instance => _singleton;

  String _convertToBase64(String clientKey, String clientSecret) {
    return base64Encode(utf8.encode('$clientKey:$clientSecret'));
  }

  String getBasicAuth(String clientKey, String clientSecret) {
    String convertedString = _convertToBase64(clientKey, clientSecret);
    return 'Basic $convertedString';
  }

  Map<String, String> getBearerAuth(String tokenKey) {
    return {authorizationHeader: 'Bearer $tokenKey'};
  }
}
