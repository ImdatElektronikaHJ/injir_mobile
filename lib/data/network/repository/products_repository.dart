import 'package:tajir/data/network/api_http_client.dart';

import '../../../model/list_product.dart';
import '../api_path.dart';

class ProductsRepository {
  Future<List<ListProduct>> fetchCategoryProducts({
    required int categoryId,
    int limit = 10,
    int page = 1,
  }) async {
    String uri = APIPathHelper.getValue(APIPath.fetchProducts);
    final response = await HttpClient.instance.fetchData(uri, params: {
      'category': categoryId.toString(),
      'limit': limit.toString(),
      'page': page.toString(),
    });

    Iterable list = response['data'];
    if (list.isEmpty) {
      return [];
    }
    return list.map((model) => ListProduct.fromJson(model)).toList();
  }

  Future<List<ListProduct>> fetchCategoryProductsWithFilters({
    required int categoryId,
    int limit = 10,
    int page = 1,
    required List<int> filters,
    String? sortOrder,
  }) async {
    String uri = APIPathHelper.getValue(APIPath.fetchProducts);
    dynamic response;
    if (sortOrder != null) {
      response = await HttpClient.instance.fetchData(uri, params: {
        'category': categoryId.toString(),
        'limit': limit.toString(),
        'page': page.toString(),
        'filters': filters.map((filterIndex) => filterIndex).toString(),
        'sort': 'price',
        'order': sortOrder
      });
    } else {
      response = await HttpClient.instance.fetchData(uri, params: {
        'category': categoryId.toString(),
        'limit': limit.toString(),
        'filters': filters.map((filterIndex) => filterIndex).toString(),
        'page': page.toString(),
      });
    }
    Iterable list = response['data'];
    return list.map((model) => ListProduct.fromJson(model)).toList();
  }

  Future<List<ListProduct>> fetchManufacturerProducts(
      {required int manufacturerId, int limit = 10, int page = 1}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchProducts);
    final response = await HttpClient.instance.fetchData(uri, params: {
      'manufacturer': '$manufacturerId',
      'limit': '$limit',
      'page': '$page'
    });
    Iterable list = response['data'];
    return list.map((model) => ListProduct.fromJson(model)).toList();
  }

  // Future<List<ListProduct>> fetchSpecialsProducts(
  //     {int limit = 10, int page = 1}) async {
  //   String uri = APIPathHelper.getValue(APIPath.fetch_specials);
  //   final response = await HttpClient.instance
  //       .fetchData(uri, params: {'limit': '$limit', 'page': '$page'});
  //   Iterable list = response['data'];
  //   return list.map((model) => ListProduct.fromJson(model)).toList();
  // }

  // Future<List<ListProduct>> fetchBestsellersAllProducts(
  //     {int limit = 10, int page = 1}) async {
  //   String uri = APIPathHelper.getValue(APIPath.fetch_bestsellers_all_products);
  //   final response = await HttpClient.instance
  //       .fetchData(uri, params: {'limit': '$limit', 'page': '$page'});
  //   Iterable list = response['data'];
  //   return list.map((model) => ListProduct.fromJson(model)).toList();
  // }
  //
  // Future<List<ListProduct>> fetchBestsellersProducts(
  //     {int limit = 10, int page = 1}) async {
  //   String uri = APIPathHelper.getValue(APIPath.fetch_bestsellers_products);
  //   final response = await HttpClient.instance
  //       .fetchData(uri, params: {'limit': '$limit', 'page': '$page'});
  //   Iterable list = response['data'];
  //   return list.map((model) => ListProduct.fromJson(model)).toList();
  // }
  //
  // Future<List<ListProduct>> fetchLatestAllProducts(
  //     {int limit = 20, int page = 1}) async {
  //   String uri = APIPathHelper.getValue(APIPath.fetch_latest_all_products);
  //   final response = await HttpClient.instance
  //       .fetchData(uri, params: {'limit': '$limit', 'page': '$page'});
  //   Iterable list = response['data'];
  //   return list.map((model) => ListProduct.fromJson(model)).toList();
  // }
  //
  // Future<List<ListProduct>> fetchLatestProducts(
  //     {int limit = 20, int page = 1}) async {
  //   String uri = APIPathHelper.getValue(APIPath.fetch_latest_products);
  //   final response = await HttpClient.instance
  //       .fetchData(uri, params: {'limit': '$limit', 'page': '$page'});
  //   Iterable list = response['data'];
  //   return list.map((model) => ListProduct.fromJson(model)).toList();
  // }
}
