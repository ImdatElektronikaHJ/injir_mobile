import 'dart:convert';

import 'package:tajir/data/network/api_http_client.dart';
import 'package:tajir/data/network/api_path.dart';
import 'package:tajir/model/account.dart';

class AccountRepository {
  Future<Account> getAccount() async {
    final url = APIPathHelper.getValue(APIPath.fetchAccount);
    final response = await HttpClient.instance.fetchData(url);
    return Account.fromJson(response['data']);
  }

  Future<List> updateAccount(Map<String, String> updatedFields) async {
    String uri = APIPathHelper.getValue(APIPath.fetchAccount);
    await HttpClient.instance.putData(uri, body: json.encode(updatedFields));
    return [];
  }

  Future logout() async {
    String uri = APIPathHelper.getValue(APIPath.fetchLogout);
    final response = await HttpClient.instance.postData(
      uri,
    );
    return response['data'];
  }
}
