import 'dart:convert';

import 'package:tajir/data/network/api_http_client.dart';

import '../api_path.dart';

class LoginRepository {
  Future<void> makeLogin(String phone, String password) async {
    var phonePasswordEncoded = jsonEncode(
        <String, String>{"email": '+993$phone', "password": password});
    await HttpClient.instance.postData(
        APIPathHelper.getValue(APIPath.fetchLogin),
        body: phonePasswordEncoded);
  }
}
