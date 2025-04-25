// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:retail/data/category_subcategory/model/category_model.dart';
// import 'package:retail/domain/category_subcategory/usecase/category_usecase.dart';
// import 'package:retail/presentation/home/notifier/home_notifier.dart';

// class FilterCategoryNotifier extends ChangeNotifier {
//   List<String> _selectedFilter = [];

//   List<CategoryModel> _categoryList = [];
//   List<String> _subCategoryList = [];
//   String? _selectedCategory;
//   String? _selectedSubCategory;
//   List<String> get selectedFilter => _selectedFilter;
//   List<CategoryModel> get categoryList => _categoryList;
//   List<String> get subCategoryList => _subCategoryList;
//   String? get selectedCategory => _selectedCategory;
//   String? get selectedSubCategory => _selectedSubCategory;
//   void getAllCategory() async {
//     try {
//       _categoryList = await CategoryUsecase().getAllCategory();
//       // if (_categoryList.isNotEmpty) {
//       //   selectOption(_categoryList.first.category);
//       // }
//       notifyListeners();
//     } catch (e) {
//       debugPrint('Error: $e');
//     }
//   }

//   void selectCategory(String category) {
//     if (_selectedCategory != null) {
//       _selectedFilter.remove(_selectedCategory);
//     }
//     _selectedCategory = category;
//     _selectedFilter.add(_selectedCategory!);
//     _subCategoryList = _categoryList
//         .firstWhere((item) => item.category == category)
//         .subcategory;

//     notifyListeners();
//   }

//   void selectSub(String subCategory) {
//     // if (_selectedSubCategory != null) {
//     //   _selectedFilter.remove(_selectedSubCategory);
//     // }
//     _selectedSubCategory = subCategory;

//     _selectedFilter.add(_selectedSubCategory!);
//     notifyListeners();
//   }

//   void removeFilter(String item) {
//     if (_selectedCategory == item) {
//       _selectedCategory = null;
//       _selectedFilter.removeWhere((sub) => _subCategoryList.contains(sub));
//       _selectedSubCategory = null;
//     }
//     _selectedFilter.remove(item);
//     notifyListeners();
//   }

//   void applyFilter(BuildContext context) {
//     final homeProvider = Provider.of<HomeNotifier>(context);
//     if (_selectedSubCategory != null) {
//       final unFilterProduct = homeProvider.productList;
//       final FilterProduct = unFilterProduct
//           .where((item) => item.subCategoryName == _selectedSubCategory);
//     }
//   }
// }

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
    print(newValue);
    notifyListeners();
  }

  void getSubCategoryList(String category) {
    var selectedCategory = _categoryList.firstWhere(
      (item) => item.category == category,
      orElse: () =>
          CategoryModel(category: '', subcategory: [], categoryId: -1),
    );
    _subCategoryList =
        selectedCategory.subcategory.map((sub) => sub.subName).toList();
    _selectSubCategories.clear();
    notifyListeners();
  }

  void onselectSubCategories(String newvalue) {
    if (_selectSubCategories.contains(newvalue)) {
      _selectSubCategories.remove(newvalue);
    } else {
      _selectSubCategories.add(newvalue);
    }
    getFilterBrandList();
    print(newvalue);
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
  }

  void clearAllFilter() {
    _selectCategoryValue = null;
    _selectSubCategories = [];
    _subCategoryList = [];
    _selectBrand = null;
    notifyListeners();
  }

  List<String> getAllFilterList() {
    if (_selectCategoryValue == null ||
        _selectSubCategories.isEmpty ||
        _selectBrand == null) {
      return [];
    } else {
      return [
        _selectCategoryValue!,
        _selectBrand!,
        ..._selectSubCategories,
      ];
    }
  }
}
