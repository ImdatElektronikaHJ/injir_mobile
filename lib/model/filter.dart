class Filter {
  final String? filterId;
  final String? name;

  Filter({
    this.filterId,
    this.name,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      filterId: json['filter_id'],
      name: json['name'],
    );
  }
}
