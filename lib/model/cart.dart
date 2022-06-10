import 'cart_product.dart';

class Cart {
  double total;
  int totalProductsCount;
  Map<int, CartProduct>? products;
  Cart({this.total = 0.00, this.totalProductsCount = 0, this.products});

  factory Cart.fromJson(Map<String, dynamic> json) {
    Iterable productsIterable = json['products'] ?? [];
    dynamic totalRaw = json['total_raw'];
    Map<int, CartProduct> cartProducts = {
      for (var mapCartProduct in productsIterable)
        int.parse(
          mapCartProduct['product_id'],
        ): CartProduct.fromJson(mapCartProduct)
    };
    return Cart(
        total: totalRaw is int ? totalRaw.toDouble() : totalRaw,
        totalProductsCount: cartProducts.length,
        products: cartProducts);
  }
}
