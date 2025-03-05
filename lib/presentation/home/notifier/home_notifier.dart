import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retail/common/constants/local_str.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/domain/home/usecase/home_usecase.dart';

class HomeNotifier extends ChangeNotifier {
  List<ProductModel> productList = [];

  void getAllProduct() async {
    try {
      productList = await HomeUsecase().getAllProducts();
    } catch (e) {
      debugPrint("Error: $e");
    }
    notifyListeners();
  }

  void addToCart(ProductModel product) async {
    List<CartModel> cartList = [];
    if (StorageUtils.getString(LocalStr.addToCartList) != "") {
      List cart = jsonDecode(StorageUtils.getString(LocalStr.addToCartList));
      for (var data in cart) {
        cartList.add(CartModel.fromJson(data));
      }
    }
    cartList.add(CartModel(
      productId: product.productId,
      name: product.name,
      description: product.description,
      brand: product.brand,
      discount: product.discount,
      status: product.status,
      basePrice: product.basePrice,
      categoryName: product.categoryName,
      subCategoryName: product.subCategoryName,
      featuredImage: product.featuredImage,
    ));
    await StorageUtils.putString(LocalStr.addToCartList, jsonEncode(cartList));
    print("CartList: >>> ${StorageUtils.getString(LocalStr.addToCartList)}");
    notifyListeners();
  }
}
