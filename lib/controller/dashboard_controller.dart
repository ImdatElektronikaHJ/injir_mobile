import 'package:get/get.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/screen/dashboard/consts/dashboard_navigation_index.dart';

class DashboardController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  final RxBool _searchBarExpanded = false.obs;

  int get currentIndex => _currentIndex.value;

  bool get searchBarExpanded => _searchBarExpanded.value;

  updateCurrentIndex(int currentIndex) async {
    int keyIdForPosition = _getKeyIdForPosition(_currentIndex.value);
    if (_currentIndex.value == currentIndex) {
      Get.keys[keyIdForPosition]!.currentState!.popUntil((r) => r.isFirst);
      updateVisibilityOfSearchBar(
          keyIdForPosition == NestedNavigationIds.search &&
              !Get.keys[keyIdForPosition]!.currentState!.canPop());
    } else {
      _popIfElementFromTopBar(currentIndex);
      _updateVisibilityOfSearchBarDueToIndex(currentIndex);
      _currentIndex.value = currentIndex;
    }
  }

  Future<bool> onWillPop() async {
    int keyIdForPosition = _getKeyIdForPosition(_currentIndex.value);
    if (keyIdForPosition != -1) {
      bool handled = await Get.keys[keyIdForPosition]!.currentState!.maybePop();
      updateVisibilityOfSearchBar(
          keyIdForPosition == NestedNavigationIds.search &&
              !Get.keys[keyIdForPosition]!.currentState!.canPop());
      if (handled) {
        return false;
      }
    }
    if (_currentIndex.value != 0) {
      _currentIndex.value = 0;
      _updateVisibilityOfSearchBarDueToIndex(_currentIndex.value);
      return false;
    }
    return true;
  }

  _popIfElementFromTopBar(int currentIndex) {
    if (currentIndex > DashboardNavigationIndex.profile) {
      Get.keys[_getKeyIdForPosition(_currentIndex.value)]!.currentState!
          .popUntil((r) => r.isFirst);
    }
  }

  int _getKeyIdForPosition(int position) {
    switch (position) {
      case DashboardNavigationIndex.home:
        return NestedNavigationIds.home;

      case DashboardNavigationIndex.categories:
        return NestedNavigationIds.categories;

      case DashboardNavigationIndex.cart:
        return NestedNavigationIds.cart;

      case DashboardNavigationIndex.stores:
        return NestedNavigationIds.stores;

      case DashboardNavigationIndex.profile:
        return NestedNavigationIds.profile;

      case DashboardNavigationIndex.wishlist:
        return NestedNavigationIds.wishlist;

      case DashboardNavigationIndex.compare:
        return NestedNavigationIds.compare;

      case DashboardNavigationIndex.search:
        return NestedNavigationIds.search;

      case DashboardNavigationIndex.becomeSeller:
        return NestedNavigationIds.becomeSeller;

      default:
        return -1;
    }
  }

  _updateVisibilityOfSearchBarDueToIndex(int currentIndex) {
    _searchBarExpanded.value = currentIndex == DashboardNavigationIndex.search;
  }

  updateVisibilityOfSearchBar(bool isVisible) {
    if (_searchBarExpanded.value != isVisible) {
      _searchBarExpanded.value = isVisible;
    }
  }
}
