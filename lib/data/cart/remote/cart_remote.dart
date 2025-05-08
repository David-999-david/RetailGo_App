import 'dart:convert';

import 'package:retail/common/constants/local_str.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/data/cart/model/cart_model.dart';

class CartRemote {
  Future<List<CartItem>> getAllAddedCart() async {
    try {
      List<CartItem> cartList = [];
      if (StorageUtils.getString(LocalStr.addToCartList) != "") {
        List cart = jsonDecode(StorageUtils.getString(LocalStr.addToCartList));
        print(cart.length);
        for (var data in cart) {
          cartList.add(CartItem.fromJson(data));
        }
      }
      return cartList;
    } catch (e) {
      rethrow;
    }
  }
}
