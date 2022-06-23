import 'dart:async';

import 'package:get/get.dart';
import 'package:tajir/controller/account_controller.dart';
import 'package:tajir/controller/account_login_status_controller.dart';
import 'package:tajir/data/network/api_exception.dart';
import 'package:tajir/model/list_product.dart';

import '../base/statefull_data.dart';
import '../const/app_routes.dart';
import '../const/nested_navigation_ids.dart';
import '../data/network/repository/wishlist_repository.dart';
import '../model/wishlist_product.dart';
import '../screen/product/product_screen.dart';

class WishlistController extends GetxController {
  AccountLoginStatus _accountLogInStatus = AccountLoginStatus.empty;
  AccountLoginStatus get accountLoginStatus => _accountLogInStatus;

  final _wishlistRepository = WishlistRepository();

  StatefullData<Map<int, WishlistProduct>> _wishListResponse =
      StatefullData.empty();

  StatefullData<Map<int, WishlistProduct>> get wishList => _wishListResponse;

  StreamSubscription<Map<int, WishlistProduct>>? _wishlistSubscription;

  final _accountLoginStatusController =
      Get.find<AccountLoginStatusController>();
  final _accountController = Get.find<AccountController>();

  void controllersUpdated() {
    _accountLogInStatus =
        _accountLoginStatusController.accountLoginStatus.value;
    update();
    if (_accountLogInStatus == AccountLoginStatus.loggedIn) {
      fetchWishList();
    }
    _accountLoginStatusController.accountLoginStatus.listen((p0) {
      _accountLogInStatus = p0;
      print(p0);
      update();
      if (_accountLogInStatus == AccountLoginStatus.loggedIn) {
        fetchWishList();
      } else {
        _wishListResponse =
            StatefullData.error(UnauthorisedException('User not logged in!'));
        update();
      }
    });
  }

  void clear() async {
    Map<int, WishlistProduct>? products = _wishListResponse.data;
    _wishListResponse.data = {};
    update();
    try {
      await _wishlistRepository.clearWishlist();
    } catch (e) {
      print('WishList error: $e');
      _wishListResponse.data = products;
      update();
    }
  }

  void fetchWishList() {
    if (_wishListResponse.status != Status.loading) {
      _wishListResponse = StatefullData.loading();
      update();
    }
    _wishlistSubscription?.cancel();

    _wishlistSubscription =
        _wishlistRepository.fetchWishlist().asStream().listen((data) {
      _wishListResponse = StatefullData.completed(data);
      update();
    }, onError: (e) {
      _wishListResponse = StatefullData.error(e);
      print('Wish list error: $e');
      update();
    });
  }

  void addProduct(
      {required int productId,
      String? thumb,
      String? name,
      String? model,
      int? quantity,
      double? price,
      double? special}) async {
    if (_wishListResponse.status == Status.completed) {
      _wishListResponse.data?[productId] = WishlistProduct(
        id: productId,
        thumb: thumb,
        name: name,
        model: model,
        quantity: quantity,
        price: price,
        salePrice: special,
        type: ProductType.quantitative,
      );
      update();
      try {
        await _wishlistRepository.addToWishlist(productId: productId);
      } catch (e) {
        print('WishList error: $e');
        if (_wishListResponse.status == Status.completed &&
            _wishListResponse.data!.containsKey(productId)) {
          _wishListResponse.data!.remove(productId);
          update();
        }
      }
    }
  }

  void removeProduct(int productId) async {
    if (_wishListResponse.status == Status.completed &&
        _wishListResponse.data!.containsKey(productId)) {
      WishlistProduct? productToRemove = _wishListResponse.data?[productId];
      _wishListResponse.data!.remove(productId);
      update();
      try {
        await _wishlistRepository.removeFromWishList(productId: productId);
      } catch (e) {
        print('WishList error: $e');
        _wishListResponse.data?[productToRemove!.id] = productToRemove;
        update();
      }
    }
  }

  bool isInWishlist(int productId) {
    return _wishListResponse.status == Status.completed &&
        _wishListResponse.data!.containsKey(productId);
  }

  void onAccountRetryTapped() {
    _accountController.fetchAccount();
  }

  void onProductTapped(int id) {
    Get.toNamed(AppRoutes.productRoute,
        id: NestedNavigationIds.wishlist, arguments: {productId: id});
  }

  @override
  void dispose() {
    _wishlistSubscription?.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    controllersUpdated();
    super.onInit();
  }
}
