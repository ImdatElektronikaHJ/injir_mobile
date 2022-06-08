import 'package:tajir/model/review.dart';

import 'category_embedded.dart';
import 'list_product.dart';

class Product {
  final int id;
  final String? name;
  final String? model;
  final String? thumb;
  final String? image;
  final List<String> images;
  final double? price;
  final double? special;
  final String? description;
  final double? quantity;
  List<ListProduct>? relatedProducts;
  List<ListProduct>? relatedBuyProducts;
  final bool? novelty;
  final ProductType? type;
  final double? minimum;
  final List<CategoryEmbedded>? categories;
  final dynamic manufacturer;
  final List<Review>? reviews;

  Product({
    required this.id,
    this.name,
    this.model,
    this.thumb,
    this.image,
    required this.images,
    this.price,
    this.special,
    this.description,
    this.quantity,
    this.relatedProducts,
    this.relatedBuyProducts,
    this.novelty,
    this.type,
    this.minimum,
    this.categories,
    this.manufacturer,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String nameFixed = json['name']
        .toString()
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&');
    // Iterable
    return Product(
      id: int.parse(json['id']),
      name: nameFixed,
      model: json['model'],
      thumb: json['image'],
      image: json['original_image'],
      images: json['original_images'].cast<String>(),
      price: _parseDouble(json['price']),
      special: _parseDouble(json['special']),
      description: json['description'],
      quantity: double.parse(json['quantity']),
      novelty: int.tryParse(json['new'].toString()) == 1,
      type: ProductType.quantitative,
      minimum: double.parse(json['minimum']),
      categories: _fetchCategories(json['categories']),
      //TODO: fetch reviews
      // reviews: json['reviews']
    );
  }

  // static List<Review> _fetchReviews(dynamic reviews) {
  //   if()
  //
  // }

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

  factory Product.dummy() {
    return Product(
      id: -1,
      name: '',
      description: '',
      thumb: '',
      images: [],
    );
  }
}
