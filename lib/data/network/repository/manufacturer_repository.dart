import 'package:tajir/model/manufacturer.dart';

import '../api_http_client.dart';
import '../api_path.dart';

class ManufacturerRepository {
  Future<List<Manufacturer>> fetchManufacturers({String? searchKey}) async {
    String uri = APIPathHelper.getValue(APIPath.fetchManufacturers);
    dynamic response;
    if (searchKey != null) {
      response = await HttpClient.instance
          .fetchData(uri, params: {'search': searchKey});
    } else {
      response = await HttpClient.instance.fetchData(uri);
    }
    Iterable list = response['data'];
    return list.map((model) => Manufacturer.fromJson(model)).toList();
  }
}
