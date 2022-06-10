import 'dart:async';

import 'package:tajir/base/statefull_data.dart';
import 'package:tajir/model/cart_product_action.dart';

import '../repository/cart_repository.dart';

enum CartSyncStatus { success, loading, error, unset }

class CartSyncHelper {
  CartRepository? _cartRepository;

  final int _timerDelayTime = 2000;

  final CartRepository? cartRepository;

  Timer? _timer;

  Map<int, CartProductAction> _pendingProducts = {};

  Map<int, CartProductAction> _sendingProducts = {};

  final Function(int, int)? onProductAdded;

  final Function(CartSyncStatus)? statusUpdated;

  late CartSyncStatus _cartSyncStatus = CartSyncStatus.unset;

  List<int> _errorList = [];

  bool _wasCancelled = false;

  CartSyncHelper(
      {this.onProductAdded, this.cartRepository, this.statusUpdated}) {
    _cartSyncStatus = CartSyncStatus.unset;
    _cartRepository = CartRepository();
  }

  void retry() {
    _timer?.cancel();
    _sendProducts();
  }

  void _cartUpdated() {
    print('Cart was updated');
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: _timerDelayTime), () {
      print('Timer started to send products!');
      if (_sendingProducts.isEmpty && !_wasCancelled) {
        _sendProducts();
      }
    });
  }

  void addProduct(int productId, int quantity) async {
    if (_cartSyncStatus != CartSyncStatus.loading) {
      _cartSyncStatus = CartSyncStatus.loading;
      statusUpdated!(_cartSyncStatus);
    }
    _cartUpdated();
    if (_sendingProducts.containsKey(productId)) {
      if (_sendingProducts[productId]?.cartAction == CartAction.add ||
          _sendingProducts[productId]?.cartAction == CartAction.update) {
        _pendingProducts[productId] = CartProductAction.update(
            _sendingProducts[productId]?.key, quantity);
      }
    } else {
      _pendingProducts[productId] = CartProductAction.add(productId, quantity);
    }
  }

  void removeProduct(int productId, {int? productKey}) async {
    if (_cartSyncStatus != CartSyncStatus.loading) {
      _cartSyncStatus = CartSyncStatus.loading;
      statusUpdated!(_cartSyncStatus);
    }
    _cartUpdated();
    if (_sendingProducts.containsKey(productId)) {
      if (_sendingProducts[productId]!.cartAction == CartAction.remove) {
        if (_pendingProducts.containsKey(productId)) {
          _pendingProducts.remove(productId);
        }
      } else {
        if (_sendingProducts[productId]!.cartAction == CartAction.add) {
          _pendingProducts[productId] = CartProductAction.remove(
              null); //on add finished add key to remove
        } else {
          if (_sendingProducts[productId]!.key == null) {
            if (_pendingProducts.containsKey(productId)) {
              _pendingProducts.remove(productId);
            }
          } else {
            _pendingProducts[productId] =
                CartProductAction.remove(_sendingProducts[productId]!.key!);
          }
        }
      }
    } else {
      if (productKey == null) {
        if (_pendingProducts.containsKey(productId)) {
          int? _productKey = _pendingProducts[productId]?.key;
          if (_productKey == null) {
            _pendingProducts.remove(productId);
          } else {
            _pendingProducts[productId] = CartProductAction.remove(_productKey);
          }
        } else {
          _pendingProducts[productId] = CartProductAction.remove(productKey);
        }
      } else {
        _pendingProducts[productId] = CartProductAction.remove(productKey);
      }
    }
  }

  updateProduct(int productId, int quantity, {int? productKey}) async {
    if (_cartSyncStatus != CartSyncStatus.loading) {
      _cartSyncStatus = CartSyncStatus.loading;
      statusUpdated!(_cartSyncStatus);
    }
    _cartUpdated();
    if (productKey != null) {
      _pendingProducts[productId] =
          CartProductAction.update(productKey, quantity);
    } else {
      if (_pendingProducts.containsKey(productId) &&
          _pendingProducts[productId]?.cartAction == CartAction.add) {
        _pendingProducts[productId]?.quantity = quantity;
      } else if (_sendingProducts.containsKey(productId) &&
          _sendingProducts[productId]!.cartAction == CartAction.add) {
        _pendingProducts[productId] = CartProductAction.update(null, quantity);
      }
    }
  }

  _sendProducts() {
    if (_pendingProducts.isNotEmpty) {
      _cartSyncStatus = CartSyncStatus.loading;
      _errorList.clear();
      if (!_wasCancelled) {
        statusUpdated!(_cartSyncStatus);
      }
      _sendingProducts.addAll(_pendingProducts);
      _pendingProducts.clear();
      _sendingProducts.forEach((productId, cartProductAction) {
        switch (cartProductAction.cartAction) {
          case CartAction.remove:
            _makeRemoveProductAction(productId, cartProductAction.key!);
            break;
          case CartAction.add:
            _makeAddProductAction(productId, cartProductAction.quantity);
            break;
          case CartAction.update:
            _makeUpdateProductAction(
                productId, cartProductAction.key!, cartProductAction.quantity);
            break;
          default:
            break;
        }
      });
    }
  }

  _makeRemoveProductAction(int productId, int productKey) async {
    try {
      await _cartRepository?.removeCartItem(productKey: productKey);
      _sendingProducts.remove(productId);
      _syncStatusUpdate(Status.completed);
    } catch (e) {
      print('Cart product removing response error: $e');
      _sendingProducts.remove(productId);
      _syncStatusUpdate(Status.error, productId: productId);
      if (_pendingProducts.containsKey(productId)) {
        if (_pendingProducts[productId]?.cartAction == CartAction.add) {
          int? quantity = _pendingProducts[productId]?.quantity;
          _pendingProducts[productId] =
              CartProductAction.update(productKey, quantity);
        } else {
          _pendingProducts[productId]?.key = productKey;
        }
      } else {
        _pendingProducts[productId] = CartProductAction.remove(productKey);
      }
    }
  }

  _makeAddProductAction(int productId, int? quantity) async {
    try {
      int productKey = await _cartRepository!
          .addToCart(productId: productId, quantity: quantity);
      if (_pendingProducts.containsKey(productId)) {
        _pendingProducts[productId]?.key = productKey;
      }
      if (onProductAdded != null && !_wasCancelled) {
        onProductAdded!(productId, productKey);
      }
      _sendingProducts.remove(productId);
      _syncStatusUpdate(Status.completed);
    } catch (e) {
      print('Cart product adding response error: $e');
      _sendingProducts.remove(productId);
      _syncStatusUpdate(Status.error, productId: productId);
      if (_pendingProducts.containsKey(productId)) {
        if (_pendingProducts[productId]?.cartAction == CartAction.remove) {
          _pendingProducts.remove(productId);
        } else if (_pendingProducts[productId]?.cartAction ==
            CartAction.update) {
          int? quantity = _pendingProducts[productId]?.quantity;
          _pendingProducts[productId] =
              CartProductAction.add(productId, quantity);
        }
      } else {
        _pendingProducts[productId] =
            CartProductAction.add(productId, quantity);
      }
    }
  }

  _makeUpdateProductAction(int productId, int productKey, int? quantity) async {
    try {
      await _cartRepository?.updateCartItem(
          productKey: productKey, quantity: quantity);
      _sendingProducts.remove(productId);
      _syncStatusUpdate(Status.completed);
    } catch (e) {
      print('Cart product updating response error: $e');
      _sendingProducts.remove(productId);
      _syncStatusUpdate(Status.error, productId: productId);
      if (!_pendingProducts.containsKey(productId)) {
        _pendingProducts[productId] =
            CartProductAction.update(productKey, quantity);
      }
    }
  }

  _syncStatusUpdate(Status responseStatus, {int? productId}) async {
    print('Status updated with $responseStatus');
    if (responseStatus == Status.error) {
      _errorList.add(productId!);
    }
    if (_pendingProducts.isEmpty &&
        _sendingProducts.isEmpty &&
        _errorList.isEmpty &&
        _cartSyncStatus != CartSyncStatus.success) {
      _cartSyncStatus = CartSyncStatus.success;
      if (statusUpdated != null && !_wasCancelled) {
        statusUpdated!(_cartSyncStatus);
      }
    } else if (_errorList.isNotEmpty &&
        _sendingProducts.isEmpty &&
        _cartSyncStatus != CartSyncStatus.error) {
      _cartSyncStatus = CartSyncStatus.error;
      print('Status updated with error');
      if (statusUpdated != null && !_wasCancelled) {
        statusUpdated!(_cartSyncStatus);
      }
    } else if (_cartSyncStatus != CartSyncStatus.loading) {
      _cartSyncStatus = CartSyncStatus.loading;
      if (statusUpdated != null && !_wasCancelled) {
        statusUpdated!(_cartSyncStatus);
      }
    }
  }

  clear() {
    _wasCancelled = true;
    if (_timer != null) {
      _timer!.cancel();
    }
    _pendingProducts = {};
    _sendingProducts = {};
    _errorList = [];
  }
}
