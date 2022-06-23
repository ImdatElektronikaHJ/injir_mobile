import 'dart:async';

import 'package:get/get.dart';
import 'package:tajir/controller/language_controller.dart';
import 'package:tajir/data/network/repository/cart_repository.dart';
import 'package:tajir/model/cart_product.dart';
import 'package:tajir/model/category_embedded.dart';
import 'package:tajir/model/list_product.dart';

import '../base/statefull_data.dart';
import '../const/app_routes.dart';
import '../const/nested_navigation_ids.dart';
import '../data/network/helpers/cart_sync_helper.dart';
import '../model/cart.dart';

class CartController extends GetxController {
  // late AccountLoginStatus _accountLogInStatus;

  final CartRepository _cartRepository = CartRepository();

  StatefullData<Cart> _cartResponse = StatefullData.empty();

  StatefullData<Cart> get cart => _cartResponse;

  StreamSubscription<Cart>? _cartSubscription;

  CartSyncStatus _syncStatus = CartSyncStatus.unset;

  CartSyncStatus get syncStatus => _syncStatus;

  CartSyncHelper _cartSyncHelper = CartSyncHelper();

  List serverProductsUpdate = [];

  List<MapEntry<int, CartProduct>> _updatedProducts = [];

  List<MapEntry<int, CartProduct>> get updatedProducts => _updatedProducts;

  final _langController = Get.find<LanguageController>();

  void fetchCart() async {
    if (_cartResponse.status != Status.loading) {
      _cartResponse = StatefullData.loading();
      update();
    }
    _cartSubscription?.cancel();
    _cartSubscription = _cartRepository.fetchCart().asStream().listen((data) {
      _cartResponse = StatefullData.completed(data);
      update();
      _cartSyncHelper.clear();
      _cartSyncHelper = CartSyncHelper(
        onProductAdded: (productId, productKey) =>
            _onProductAdded(productId, productKey),
        statusUpdated: (cartSyncStatus) => _onSyncStatusUpdated(cartSyncStatus),
      );
      // _checkStockCart();

      _updatedProducts = [];
      serverProductsUpdate = [];
      update();
    }, onError: (e) {
      _cartResponse = StatefullData.error(e);
      print('Cart error: $e');
      update();
    });
  }

  void removeProduct(int productId) async {
    CartProduct? productToRemove = _cartResponse.data?.products?[productId];
    if (_cartResponse.status == Status.completed && productToRemove != null) {
      _cartResponse.data?.products?.remove(productId);
      update();
      _cartSyncHelper.removeProduct(productId, productKey: productToRemove.key);
      _productsTotalUpdated();
    }
  }

  void incrementTapped(int productId) async {
    CartProduct? cartProduct = _cartResponse.data?.products?[productId];

    int? quantity = ((cartProduct?.quantity ?? 0) + 1);
    updateProductQuantity(quantity, productId);
  }

  void decrementTapped(int productId, {bool removeEnabled = true}) async {
    CartProduct? cartProduct = _cartResponse.data?.products?[productId];
    if (cartProduct != null) {
      int? currentQuantity = cartProduct.quantity;
      if (currentQuantity! > 1) {
        updateProductQuantity((currentQuantity) - (1), productId);
      } else {
        if (removeEnabled) {
          removeProduct(productId);
        }
      }
    }
  }

  void addProduct(
      {required int productId,
      String? thumb,
      String? name,
      String? model,
      bool? inStock,
      double? price,
      ProductType? type,
      List<CategoryEmbedded>? categories,
      double? salePrice}) async {
    if (_cartResponse.status == Status.completed) {
      CartProduct productToAdd = CartProduct(
          id: productId,
          thumb: thumb,
          name: name,
          model: model,
          quantity: 1,
          inStock: inStock,
          price: price,
          type: type,
          isUpdated: false,
          categories: categories,
          salePrice: salePrice);
      _cartResponse.data?.products?[productId] = productToAdd;
      _cartSyncHelper.addProduct(productId, 1);
      _productsTotalUpdated();
    }
  }

  void _onProductAdded(int productId, int productKey) {
    if (_cartResponse.status == Status.completed &&
        _cartResponse.data!.products!.containsKey(productId)) {
      _cartResponse.data?.products?[productId]?.key = productKey;
    }
  }

  void updateProductQuantity(int quantity, int productId) async {
    if (_cartResponse.status == Status.completed) {
      CartProduct? cartProduct = _cartResponse.data?.products?[productId];
      _cartResponse.data?.products?[productId]?.quantity = quantity;
      update();
      print('cart key: ${cartProduct?.key}');
      _cartSyncHelper.updateProduct(productId, quantity,
          productKey: cartProduct?.key);
      _productsTotalUpdated();
    }
  }

  void clear() async {
    Cart? cart = _cartResponse.data;
    _cartResponse.data = Cart(products: {});
    update();
    try {
      await _cartRepository.clear();
    } catch (e) {
      print('Cart error: $e');
      _cartResponse.data = cart;
      update();
    }
  }

  void cartWasCleared() {
    _cartResponse.data = Cart(products: {});
    update();
  }

  void _productsTotalUpdated() async {
    double total = 0.00;
    for (CartProduct product in _cartResponse.data!.products!.values) {
      total += product.quantity! * product.price!;
    }
    _cartResponse.data?.total = total;
    _cartResponse.data?.totalProductsCount =
        _cartResponse.data!.products!.length;
    update();
  }

  void _onSyncStatusUpdated(CartSyncStatus cartSyncStatus) {
    print('Sync status is: $cartSyncStatus');
    _syncStatus = cartSyncStatus;
    update();
  }

  void retrySync() {
    _cartSyncHelper.retry();
  }

  void _langWasUpdated() {
    _langController.selectedLocale.listen((p0) {
      fetchCart();
    });
  }

  void onProductTapped(int productId) {
    Get.toNamed(AppRoutes.productRoute,
        id: NestedNavigationIds.cart, arguments: {productId: productId});
  }

  @override
  void onInit() {
    fetchCart();
    _langWasUpdated();
    super.onInit();
  }

  @override
  void dispose() {
    _cartSyncHelper.clear();
    super.dispose();
  }
}
