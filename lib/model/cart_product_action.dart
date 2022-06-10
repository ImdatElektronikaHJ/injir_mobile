enum CartAction { remove, add, update }

class CartProductAction {
  int? id;
  int? key;
  CartAction? cartAction;
  int? quantity;

  CartProductAction.remove(int? key) {
    cartAction = CartAction.remove;
    this.key = key;
  }

  CartProductAction.add(int? productId, int? quantity) {
    cartAction = CartAction.add;
    id = productId;
    this.quantity = quantity;
  }

  CartProductAction.update(int? key, int? quantity) {
    cartAction = CartAction.update;
    this.key = key;
    this.quantity = quantity;
  }
}
