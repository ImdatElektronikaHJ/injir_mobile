import 'category_embedded.dart';
import 'list_product.dart';

class CartProduct {
  int? key;
  final int id;
  final String? thumb;
  final String? name;
  final String? model;
  int? quantity;
  bool? inStock;
  final double? price;
  final ProductType? type;
  final List<CategoryEmbedded>? categories;
  bool? isUpdated = false;
  double? newQuantity;
  final double? salePrice;

  CartProduct({
    required this.id,
    this.key,
    this.inStock,
    this.thumb,
    this.name,
    this.model,
    this.price,
    this.quantity,
    this.type,
    this.isUpdated,
    this.newQuantity,
    this.categories,
    this.salePrice,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    String nameFixed = json['name']
        .toString()
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&');
    return CartProduct(
        key: int.parse(json['key']),
        id: json['product_id'] is int
            ? json['product_id']
            : int.parse(json['product_id']),
        thumb: json['thumb'],
        name: nameFixed,
        price: _parseDouble(json['price']),
        model: json['model'],
        type: ProductType.quantitative,
        inStock: json['stock'],
        quantity: int.tryParse(json['quantity']),
        // step: double.tryParse(json['shag']),
        // minimum: double.tryParse(json['minimum']),
        isUpdated: false,
        newQuantity: 0,
        salePrice: json['special']
        // categories: _fetchCategories(json['categories'] ?? []),
        );
  }

  // static List<CategoryEmbedded> _fetchCategories(List<dynamic>? categories) {
  //   List<CategoryEmbedded> fetchedCategories = [];
  //   if (categories != null) {
  //     for (var element in categories) {
  //       fetchedCategories.add(CategoryEmbedded(
  //           categoryId: int.tryParse(element['id'])!, name: element['name']));
  //     }
  //   }
  //   return fetchedCategories;
  // }

  static double? _parseDouble(dynamic price) {
    if (price is bool) {
      return null;
    }

    if (price is int && price >= 0) {
      return price.toDouble();
    }

    if (price is String) {
      List priceSplitted = price.split(' ');
      String priceFormatted = priceSplitted.first;
      // print(asd);
      return double.tryParse(priceFormatted);
    }

    if (price is double && price >= 0.0) {
      return price;
    }
    return null;
  }
}
