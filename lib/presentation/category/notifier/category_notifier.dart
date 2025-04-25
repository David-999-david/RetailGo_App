import 'package:flutter/material.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/domain/home/usecase/home_usecase.dart';

class CategoryNotifier {
  List<ProductModel> productList = [];
  List<ProductModel> filterProductList = [];

  void getAllProduct() async {
    try {
      productList = await HomeUsecase().getAllProducts();
    } catch (e) {
      debugPrint('Error $e');
    }
  }
}
