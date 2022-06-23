import '../../../model/wishlist_product.dart';
import '../api_http_client.dart';
import '../api_path.dart';

class WishlistRepository {
  Future<Map<int, WishlistProduct>> fetchWishlist() async {
    String uri = APIPathHelper.getValue(APIPath.fetchWishList);
    final response = await HttpClient.instance.fetchData(
      uri,
    );
    Iterable wishListIterable = response['data'];

    Map<int, WishlistProduct> wishListProducts = {};
    for (var element in wishListIterable) {
      WishlistProduct wishlistProduct = WishlistProduct.fromJson(element);
      wishListProducts[wishlistProduct.id] = wishlistProduct;
    }
    return wishListProducts;
  }

  Future addToWishlist({required int productId}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchWishList);
    final response =
        await HttpClient.instance.postData(uri, params: {'id': '$productId'});
    return response;
  }

  Future removeFromWishList({required int productId}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchWishList);
    final response =
        await HttpClient.instance.delete(uri, params: {'id': '$productId'});
    return response;
  }

  Future clearWishlist() async {
    String uri = APIPathHelper.getValue(APIPath.fetchWishListClear);
    final response = await HttpClient.instance.postData(
      uri,
    );
    return response;
  }
}
