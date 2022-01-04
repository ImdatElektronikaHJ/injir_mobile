class Manufacturer {
  final int manufacturerId;
  final String? name;
  final String? image;
  final int? sortOrder;

  Manufacturer(
      {required this.manufacturerId, this.name, this.image, this.sortOrder});

  factory Manufacturer.fromJson(Map<String, dynamic> json) {
    return Manufacturer(
      manufacturerId: int.parse(json['manufacturer_id']),
      name: json['name'],
      image: json['image'],
      sortOrder: int.parse(json['sort_order']),
    );
  }
}
