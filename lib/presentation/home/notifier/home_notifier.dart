import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retail/common/constants/local_str.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/core/network/storage_utils.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/domain/home/usecase/home_usecase.dart';
import 'package:retail/presentation/category/widget/category_product.dart';

class HomeNotifier extends ChangeNotifier {
  List<ProductModel> productList = [];

  final TextEditingController _searchController = TextEditingController();

  int selectedIndex = 0;

  int selectedSubCateIndex = -1;

  TextEditingController get searchController => _searchController;

  void isSelected(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
    } else {
      selectedIndex = index;
    }
    notifyListeners();
  }

  void isSelectedSub(int index) {
    if (selectedSubCateIndex != index) {
      selectedSubCateIndex = index;
    }
    notifyListeners();
  }

  HomeNotifier() {
    _searchController.addListener(() {
      notifyListeners();
    });
  }

  

  void getAllProduct() async {
  try {
    productList = await HomeUsecase().getAllProducts();
    debugPrint('➤ Loaded ${productList.length} products');
  } catch (e) {
    debugPrint('Error loading products: $e');
  }
  notifyListeners();
}


  void getFilterProduct(
      BuildContext context, ProductModel selectedProduct) async {
    try {
      final unFilterList = await HomeUsecase().getAllProducts();
      productList = unFilterList.where((product) {
        return product.categoryName == selectedProduct.categoryName;
      }).toList();
      AppNavigator.push(context, CategoryProduct(productList: productList));
    } catch (e) {
      debugPrint('Error: $e');
    }
    notifyListeners();
  }

  void filterSubProduct(ProductModel selectedProduct) async {
    try {
      final List<ProductModel> unFilterList =
          await HomeUsecase().getAllProducts();
      productList = unFilterList.where((product) {
        return product.subCategoryName == selectedProduct.subCategoryName;
      }).toList();
    } catch (e) {
      debugPrint("Error: $e ");
    }
    notifyListeners();
  }

  void addToCart(ProductModel product) async {
    List<CartItem> cartList = [];
    if (StorageUtils.getString(LocalStr.addToCartList) != "") {
      List cart = jsonDecode(StorageUtils.getString(LocalStr.addToCartList));
      for (var data in cart) {
        cartList.add(CartItem.fromJson(data));
      }
    }
    cartList.add(CartItem(
      id: product.productId, 
      title: product.name, 
      price: product.basePrice as double, 
      quantity: 2, 
      imageUrl: product.featuredImage, 
      attributes: product.attributes));
    await StorageUtils.putString(LocalStr.addToCartList, jsonEncode(cartList));
    print("CartList: >>> ${StorageUtils.getString(LocalStr.addToCartList)}");
    notifyListeners();
  }
}
