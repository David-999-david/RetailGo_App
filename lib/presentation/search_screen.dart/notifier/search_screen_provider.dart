import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/home/model/product_model.dart';

class SearchScreenProvider extends ChangeNotifier{

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  final List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  final List<ProductModel> _filterProductList = [];
  List<ProductModel> get filterProductList => _filterProductList;

  List<String> _filterList = [];
  List<String> get filterList => _filterList;
  
  void getAllProduct() async {}

  void getFilterProduct(String searchText) async {}

  showBottomSheet(BuildContext context, Widget child) {
    final read = context.read<SearchScreenProvider>();
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => 
        ChangeNotifierProvider.value(value: read,child: child,)
        );
  }

  void setFilterList(List<String> filterList){
    _filterList = filterList;
    notifyListeners();
  }
}