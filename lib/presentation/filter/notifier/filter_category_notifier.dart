import 'package:flutter/material.dart';
import 'package:retail/data/category_subcategory/model/category_model.dart';
import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/domain/category_subcategory/usecase/category_usecase.dart';
import 'package:retail/domain/home/usecase/home_usecase.dart';

class FilterCategoryNotifier extends ChangeNotifier {
  List<CategoryModel> _categoryList = [];

  List<String> _subCategoryList = [];

  List<String> _brandList = [];

  String? _selectCategoryValue;

  List<String> _selectSubCategories = [];

  List<ProductModel> _productList = [];

  String? _selectBrand;

  List<CategoryModel> get categoryList => _categoryList;

  List<String> get subCategoryList => _subCategoryList;

  List<String> get brandList => _brandList;

  String? get selectCategorytValue => _selectCategoryValue;

  List<String> get selectSubCategories => _selectSubCategories;

  String? get selectBrand => _selectBrand;

  void getAllCategory() async {
    try {
      _categoryList = await CategoryUsecase().getAllCategory();
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void getAllProduct() async {
    try {
      _productList = await HomeUsecase().getAllProducts();
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void onSelectCategoryValue(String? newValue) {
    _selectCategoryValue = newValue;
    // if (newValue != null) {
    //   getSubCategoryList(newValue);
    // }
    if (_selectSubCategories.isNotEmpty) {
      _selectSubCategories = [];
    }
    print('Category : $newValue');
    notifyListeners();
  }

  void getSubCategoryList(String? category) {
    var selectedCategory = _categoryList.firstWhere(
      (item) => item.category == category,
      orElse: () =>
          CategoryModel(category: '', subcategory: [], categoryId: -1),
    );
    _subCategoryList =
        selectedCategory.subcategory.map((sub) => sub.subName).toList();
    _selectSubCategories.clear();
    print('Sub-Categories : $_subCategoryList');
    notifyListeners();
  }

  // void onselectSubCategories(String? newvalue) {
  //   if (_selectSubCategories.contains(newvalue)) {
  //     _selectSubCategories.remove(newvalue);
  //   } else {
  //     _selectSubCategories.add(newvalue!);
  //   }
  //   getFilterBrandList();
  //   print(newvalue);
  //   notifyListeners();
  // }

  void updateSelectedSubCategories(List<String> values) {
    _selectSubCategories = List.from(values);
    print(_selectSubCategories);
    getFilterBrandList();

    notifyListeners();
  }

  void getFilterBrandList() {
    if (_selectSubCategories.isEmpty) {
      _brandList = [];
      return;
    } else {
      Set<String> filterBrand = {};
      for (var product in _productList) {
        if (_selectSubCategories.contains(product.subCategoryName)) {
          filterBrand.add(product.brand);
        }
      }
      _brandList = List.of(filterBrand);
      print(_brandList);
      notifyListeners();
    }
  }

  void onSelectBrand(String? newValue) {
    _selectBrand = newValue;
    print(newValue);
    notifyListeners();
  }

  void removeSubFilter(String subFilter) {
    _selectSubCategories.remove(subFilter);
    notifyListeners();
  }

  void removeHomeFilterItem(String item) {
    if (_selectCategoryValue == item) {
      _selectCategoryValue = null;
    } else {
      _selectSubCategories.remove(item);
    }
    notifyListeners();
  }

  void clearAllFilter() {
    _selectCategoryValue = null;
    _selectSubCategories = [];
    _selectBrand = null;
    notifyListeners();
  }

  List<String> getAllFilterList(){
    final List<String> filterList = [];
    if (_selectCategoryValue != null){
      filterList.add(_selectCategoryValue!);
    }
    if (_selectSubCategories.isNotEmpty){
      filterList.addAll(_selectSubCategories);
    }
    if (_selectBrand != null){
      filterList.add(_selectBrand!);
    }
    print('All Filter items : $filterList');
    return filterList;
  }
}
