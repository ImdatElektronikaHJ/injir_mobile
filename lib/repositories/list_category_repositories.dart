import '../data/network/api_http_client.dart';
import '../data/network/api_path.dart';
import '../model/list_category.dart';

class CategoriesRepository {
  Future<List<ListCategory>> fetchListCategory() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetchCategories));
    Iterable list = response;
    return list.map((e) => ListCategory.fromJson(e)).toList();
  }
}
