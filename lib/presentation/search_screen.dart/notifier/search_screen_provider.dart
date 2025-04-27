import 'package:flutter/material.dart';
import 'package:retail/data/home/model/product_model.dart';

class SearchScreenProvider extends ChangeNotifier{

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  final List<ProductModel> _filterProductList = [];
  List<ProductModel> get filterProductList => _filterProductList;
  
  void getAllProduct() async {}

  void getFilterProduct(String searchText) async {}
}