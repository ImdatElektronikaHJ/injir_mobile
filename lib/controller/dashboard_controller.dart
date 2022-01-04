import 'package:get/get.dart';
import 'package:tajir/const/nested_navigation_ids.dart';
import 'package:tajir/screen/dashboard/consts/dashboard_navigation_index.dart';

class DashboardController extends GetxController {
  ///Current index of navigation page.
  final RxInt _currentIndex = 0.obs;

  ///Flag to check whether search bar is expanded or not.
  final RxBool _searchBarExpanded = false.obs;

  ///Getter for current index.
  int get currentIndex => _currentIndex.value;

  ///Getter for getting search bar expanded flag.
  bool get searchBarExpanded => _searchBarExpanded.value;

  ///Update current index due to selection.
  ///
  ///This method used on bottom navigation or top navigation tapped.
  ///Variable currentIndex used to change current page index of navigation.
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

  ///Method responsible for handling back tapping event
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

  ///Clear history of nested navigation if selected index related to top bar
  _popIfElementFromTopBar(int currentIndex) {
    if (currentIndex > DashboardNavigationIndex.profile) {
      Get.keys[_getKeyIdForPosition(currentIndex)]!.currentState!
          .popUntil((r) => r.isFirst);
    }
  }

  ///Method to getting id from selected navigation index.
  ///
  ///NestedNavigationIds is different from
  ///DashboardNavigationIndex, NestedNavigationIds could take any
  ///random int.
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

  ///Update visibility of search bar.
  ///
  ///Will show true if current index will be DashboardNavigationIndex.search.
  _updateVisibilityOfSearchBarDueToIndex(int currentIndex) {
    _searchBarExpanded.value = currentIndex == DashboardNavigationIndex.search;
  }

  ///Public method to update visibility of search bar.
  updateVisibilityOfSearchBar(bool isVisible) {
    if (_searchBarExpanded.value != isVisible) {
      _searchBarExpanded.value = isVisible;
    }
  }
}
