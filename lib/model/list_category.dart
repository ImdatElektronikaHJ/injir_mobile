class ListCategory {
  static List<ListCategory> categories = [];

  final int id;
  final int? parentId;
  final String name;
  final String? image;
  final String? icon;
  final List<ListCategory>? children;

  ListCategory({
    required this.id,
    this.parentId,
    required this.name,
    this.image,
    this.icon,
    this.children,
  });

  factory ListCategory.fromJson(Map<String, dynamic> json) {
    Iterable children = json['categories'];
    return ListCategory(
      id: int.parse(json['category_id']),
      parentId: int.parse(json['parent_id']),
      name: json['name'],
      image: json['image'],
      icon: json['icon'],
      children: children.map((model) => ListCategory.fromJson(model)).toList(),
    );
  }

  factory ListCategory.dummy() {
    return ListCategory(
      id: -1,
      name: '',
      image: '',
      icon: '',
    );
  }
}
