import 'category_embedded.dart';

enum ProductType { quantitative, byWeight }

class ListProduct {
  static List<ListProduct>? list = [];
  final int id;
  final String? thumb;
  final String? name;
  final double? price;
  final double? special;
  final String? description;
  final String? model;
  final bool? novelty;
  final double? quantity;
  final ProductType? type;
  final double? minimum;
  final List<CategoryEmbedded>? categories;
  final double? maxCount;

  ListProduct({
    required this.id,
    this.thumb,
    this.name,
    this.special,
    this.model,
    this.price,
    this.quantity,
    this.description,
    this.novelty,
    this.type,
    this.minimum,
    this.categories,
    this.maxCount,
  });

  factory ListProduct.fromJson(Map<String, dynamic> json) {
    String nameFixed = json['name']
        .toString()
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&');
    return ListProduct(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']),
      thumb: json['image'],
      name: nameFixed,
      price: _parseDouble(json['price']),
      special: _parseDouble(json['special']),
      model: json['model'],
      description: json['description'],
      quantity: double.parse(json['quantity']),
      novelty: json['new'] == null
          ? null
          : int.tryParse(json['new'].toString()) == 1,
      type: ProductType.quantitative,
      minimum: double.tryParse(json['minimum']),
      categories: _fetchCategories(json['category']),
    );
  }

  int getDiscount() {
    double discountPercent = 0.00;
    if (special != null && price != null) {
      discountPercent = 100.00 - (special! * 100.00 / price!);
    }
    return discountPercent.toInt();
  }

  static List<CategoryEmbedded> _fetchCategories(List<dynamic>? categories) {
    List<CategoryEmbedded> fetchedCategories = [];
    if (categories != null) {
      for (var element in categories) {
        fetchedCategories.add(CategoryEmbedded(
            categoryId: int.tryParse(element['id'])!, name: element['name']));
      }
    }
    return fetchedCategories;
  }

  // static bool? _parseLimited(dynamic limited) {
  //   if (limited is bool) {
  //     return limited;
  //   }
  //
  //   if (limited is String) {
  //     return int.parse(limited) == 1;
  //   }
  //
  //   if (limited is int) {
  //     return limited == 1;
  //   }
  //
  //   return null;
  // }

  static double? _parseDouble(dynamic price) {
    if (price is bool) {
      return null;
    }

    if (price is int && price >= 0) {
      return price.toDouble();
    }

    if (price is String) {
      return double.tryParse(price);
    }

    if (price is double && price >= 0.0) {
      return price;
    }
    return null;
  }
}
