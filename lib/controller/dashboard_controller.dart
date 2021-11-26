import 'package:get/get.dart';
import 'package:tajir/const/nested_navigation_ids.dart';

class DashboardController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;

  updateCurrentIndex(int currentIndex) {
    _currentIndex.value = currentIndex;
  }

  Future<bool> onWillPop() async {
    int keyIdForPosition = _getKeyIdForPosition(_currentIndex.value);
    if (keyIdForPosition != -1) {
      bool handled = await Get
          .keys[_getKeyIdForPosition(_currentIndex.value)]!.currentState!
          .maybePop();
      if (handled) {
        return false;
      }
    }
    if (_currentIndex.value != 0) {
      _currentIndex.value = 0;
      return false;
    }
    return true;
  }

  int _getKeyIdForPosition(int position) {
    switch (position) {
      case 0:
        return NestedNavigationIds.home;
      case 1:
        return NestedNavigationIds.categories;
      case 2:
        return NestedNavigationIds.cart;
      case 3:
        return NestedNavigationIds.stores;
      case 4:
        return NestedNavigationIds.profile;
      default:
        return -1;
    }
  }
}
