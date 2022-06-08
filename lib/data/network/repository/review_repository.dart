import 'dart:convert';

import 'package:tajir/data/network/api_http_client.dart';
import 'package:tajir/data/network/api_path.dart';

import '../../../model/review.dart';

class ReviewRepository {
  Future<dynamic> postReview(Review review, int id) async {
    String url = APIPathHelper.getValue(APIPath.fetchReview);
    final response = await HttpClient.instance.postData(url,
        body: jsonEncode(review.toJson()), params: {'id': id.toString()});
    return response;
  }
}
