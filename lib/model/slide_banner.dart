import 'package:flutter/cupertino.dart';

class SlideBanner {
  final String? title;
  final String? image;
  final String? link;

  SlideBanner({this.title, @required this.image, this.link});

  factory SlideBanner.fromJson(Map<String, dynamic> json) {
    return SlideBanner(
      title: json['title'],
      link: json['link'],
      image: json['image'],
    );
  }
}
