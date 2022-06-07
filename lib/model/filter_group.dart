import 'filter.dart';

class FilterGroup {
  static List<FilterGroup> filters = [];

  final String? groupId;
  final String? name;
  final List<Filter>? filter;

  FilterGroup({
    this.groupId,
    this.name,
    this.filter,
  });

  factory FilterGroup.fromJson(Map<String, dynamic> json) {
    Iterable filter = json['filter'];
    return FilterGroup(
      groupId: json['filter_group_id'],
      name: json['name'],
      filter: filter.map((e) => Filter.fromJson(e)).toList(),
    );
  }
}
