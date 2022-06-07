import 'category_embedded.dart';
import 'filter_group.dart';
import 'list_product.dart';

class CategoryModel {
  final int id;
  final String name;
  final String? image;
  final String? originalImage;
  final List<CategoryEmbedded>? subCategories;
  final List<FilterGroup>? filters;
  List<ListProduct>? categoryProducts;

  CategoryModel({
    required this.id,
    required this.name,
    this.image,
    this.originalImage,
    this.subCategories,
    this.filters,
    this.categoryProducts,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    Iterable subCategories = json['sub_categories'];
    Iterable filters = json['filters']['filter_groups'];
    return CategoryModel(
      id: int.parse(json['id']),
      name: json['name'],
      image: json['image'],
      subCategories:
          subCategories.map((e) => CategoryEmbedded.fromJson(e)).toList(),
      filters: filters.map((e) => FilterGroup.fromJson(e)).toList(),
    );
  }

  factory CategoryModel.dummy() {
    return CategoryModel(
      id: -1,
      name: '',
      image: '',
      subCategories: [],
      filters: [],
    );
  }
}
