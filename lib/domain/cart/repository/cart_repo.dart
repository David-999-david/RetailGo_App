import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/data/cart/remote/cart_remote.dart';

class CartRepo {
  Future<List<CartItem>> getAllCart() {
    return CartRemote().getAllAddedCart();
  }
}
