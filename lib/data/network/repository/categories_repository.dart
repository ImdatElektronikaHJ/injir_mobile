import 'package:tajir/model/list_category.dart';

import '../api_http_client.dart';
import '../api_path.dart';

class CategoriesRepository {
  Future<List<ListCategory>> fetchCategories({int level = 1}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchCategories);
    Map<String, String> params = {'level': '$level'};
    final response = await HttpClient.instance.fetchData(uri, params: params);
    Iterable list = response['data'];
    return list.map((model) {
      return ListCategory.fromJson(model);
    }).toList();
  }
}
