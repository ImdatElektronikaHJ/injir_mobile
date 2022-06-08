import 'package:tajir/data/network/api_http_client.dart';
import 'package:tajir/data/network/api_path.dart';
import 'package:tajir/model/product.dart';

class ProductRepository {
  Future<Product> fetchProduct(int productId) async {
    String uri = APIPathHelper.getValue(APIPath.fetchProducts);
    var response = await HttpClient.instance
        .fetchData(uri, params: {'id': productId.toString()});
    return Product.fromJson(response['data']);
  }
}
