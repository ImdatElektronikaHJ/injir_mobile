class SlideBanner {
  final int? id;
  final String? title;
  final String? image;
  final String? link;
  final String? type;

  SlideBanner({this.title, required this.image, this.link, this.type, this.id});

  factory SlideBanner.fromJson(Map<String, dynamic> json) {
    return SlideBanner(
      id: int.parse(json['mobile_id']),
      title: json['title'],
      link: json['link'],
      image: json['image'],
      type: json['mobile_type'],
    );
  }
}
