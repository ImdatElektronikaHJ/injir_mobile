import 'dart:convert';

import 'package:tajir/data/network/api_http_client.dart';
import 'package:tajir/data/network/api_path.dart';
import 'package:tajir/model/cart.dart';

class CartRepository {
  Future<Cart> fetchCart() async {
    String uri = APIPathHelper.getValue(APIPath.fetchCart);
    final response = await HttpClient.instance.fetchData(uri);
    // print(response );
    return response['data'] is List
        ? Cart(products: {})
        : Cart.fromJson(response['data']);
  }

  Future<int> addToCart({required int productId, int? quantity = 1}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchCart);
    final response = await HttpClient.instance.postData(uri,
        body: jsonEncode({
          'product_id': productId.toString(),
          'quantity': quantity.toString()
        }));
    print(response);

    var key = response['data']['product']['product_id'];
    if (key is String) {
      return int.parse(key);
    } else {
      return key;
    }
  }

  Future addListToCart({required Map<int, int> products}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchCartBulk);
    final response = await HttpClient.instance
        .postData(uri, body: _parseList(products: products));
    return response['data'];
  }

  String _parseList({required Map<int, int> products}) {
    List<Map<String, int>> parsedList = [];
    products.forEach((key, value) {
      parsedList.add({"product_id": key, "quantity": value});
    });
    return jsonEncode(parsedList);
  }

  Future updateCartItem({required int productKey, int? quantity = 1}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchCart);
    final response = await HttpClient.instance.putData(uri,
        body: jsonEncode(
            {'key': productKey.toString(), 'quantity': quantity.toString()}));
    return response['data'];
  }

  Future removeCartItem({required productKey}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchCart);
    final response = await HttpClient.instance.delete(uri,
        body: jsonEncode({
          'key': productKey.toString(),
        }));
    return response['data'];
  }

  Future clear() async {
    String uri = APIPathHelper.getValue(APIPath.fetchCartEmpty);
    final response = await HttpClient.instance.delete(
      uri,
    );
    return response['data'];
  }

// Future<Map> checkStockCart() async {
//   String uri = APIPathHelper.getValue(APIPath.fetch_check_stock_cart);
//   final response = await HttpClient.instance.fetchData(
//     uri,
//   );
//   return response['data'];
// }
}
