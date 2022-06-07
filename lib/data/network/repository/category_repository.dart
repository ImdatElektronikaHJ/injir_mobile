import '../../../model/category.dart';
import '../api_http_client.dart';
import '../api_path.dart';

class CategoryRepository {
  Future<CategoryModel> fetchCategory({required int id}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchCategories);
    Map<String, String> params = {'id': '$id'};
    final response = await HttpClient.instance.fetchData(uri, params: params);
    return CategoryModel.fromJson(response['data']);
  }
}
