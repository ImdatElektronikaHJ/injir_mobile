import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    if (kReleaseMode) {
      return 'http://tajir.imdatel.tm';
    } else {
      return 'http://tajir.imdatel.tm';
    }
  }
}
