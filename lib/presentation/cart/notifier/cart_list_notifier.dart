import 'package:flutter/material.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/domain/cart/usecase/cart_usecase.dart';

class CartListNotifier extends ChangeNotifier {
  List<CartModel> cartList = [];

  void getAllCart() async {
    try {
      cartList = await CartUsecase().getAllCart();
    } catch (e) {
      debugPrint("Error: $e");
    }
    notifyListeners();
  }

  void qtyChange(CartModel cart, int type) {
    debugPrint("Qty: ${cart.qty}");
    if (type == 1) {
      debugPrint("Type 1");
      cart.qty = cart.qty + 1;
    } else {
      debugPrint("Type 0");
      cart.qty = cart.qty - 1;
      if (cart.qty == 0) {
        cartList.remove(cart);
      }
    }
    debugPrint("Qty Changed: ${cart.qty}");
    notifyListeners();
  }
}
