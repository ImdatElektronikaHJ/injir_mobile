import 'dart:convert';

import 'package:tajir/data/network/api_http_client.dart';
import 'package:tajir/data/network/api_path.dart';
import 'package:tajir/model/registration_account.dart';

class AccountRegistrationRepository {
  Future<void> makeRegistration(RegistrationAccount account) async {
    var accountEncoded = jsonEncode(account.toJson());
    await HttpClient.instance.postData(
        APIPathHelper.getValue(APIPath.fetchRegistration),
        body: accountEncoded);
  }
}
