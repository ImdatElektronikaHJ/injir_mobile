import 'package:tajir/model/slide_banner.dart';
import '../api_http_client.dart';
import '../api_path.dart';

class SlideBannerRepository {
  Future<List<SlideBanner>> fetchSlideShow() async {
    final response = await HttpClient.instance
        .fetchData(APIPathHelper.getValue(APIPath.fetchBanners), params: {
      'id': '12', //TODO need to change the id of banner
    });
    Iterable list = response['data'];
    return list.map((model) => SlideBanner.fromJson(model)).toList();
  }
}
