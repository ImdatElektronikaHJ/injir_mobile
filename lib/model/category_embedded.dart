class CategoryEmbedded {
  final int categoryId;
  final String name;
  final List<CategoryEmbedded>? categories;
  final String? image;

  CategoryEmbedded({
    required this.categoryId,
    required this.name,
    this.categories,
    this.image,
  });

  factory CategoryEmbedded.fromJson(Map<String, dynamic> json) {
    Iterable categories = json['categories'];
    return CategoryEmbedded(
      categoryId: int.parse(json['category_id']),
      name: json['name'],
      categories: categories.map((e) => CategoryEmbedded.fromJson(e)).toList(),
      image: json['image'],
    );
  }
}
