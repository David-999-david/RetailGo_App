import 'package:flutter/material.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/domain/cart/usecase/cart_usecase.dart';

class CartListNotifier extends ChangeNotifier {
  List<CartItem> cartList = [];

  void getAllCart() async {
    try {
      cartList = await CartUsecase().getAllCart();
    } catch (e) {
      debugPrint("Error: $e");
    }
    notifyListeners();
  }

  void qtyChange(CartItem cart, int type) {
    debugPrint("Qty: ${cart.quantity}");
    if (type == 1) {
      debugPrint("Type 1");
      cart.quantity = cart.quantity + 1;
    } else {
      debugPrint("Type 0");
      cart.quantity = cart.quantity - 1;
      if (cart.quantity == 0) {
        cartList.remove(cart);
      }
    }
    debugPrint("Qty Changed: ${cart.quantity}");
    notifyListeners();
  }
}
