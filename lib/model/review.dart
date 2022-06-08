class Review {
  int? id;
  String? text;
  String? name;
  double? rating;

  Review({this.id, this.text, this.rating, this.name});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      text: json['text'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'text': text, 'rating': rating.toString()};
}
