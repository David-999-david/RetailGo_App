import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/category/notifier/category_notifier.dart';
import 'package:retail/presentation/filter/notifier/filter_category_notifier.dart';
import 'package:retail/presentation/filter/widget/category_filter.dart';
import 'package:retail/presentation/filter/widget/selected_filter_list.dart';
import 'package:retail/presentation/filter/widget/subcategory_filter.dart';
import 'package:retail/presentation/home/home_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilterCategoryNotifier()
        ..getAllCategory()
        ..getAllProduct(),
      child: Consumer<FilterCategoryNotifier>(
        builder: (context, provider, child) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Filter',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _categoryDropDown(context, provider),
                  SizedBox(
                    height: 30,
                  ),
                  _subCategoryDropDown(context, provider),
                  SizedBox(
                    height: 30,
                  ),
                  _brandDropDown(context, provider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('Clear')),
                      ElevatedButton(onPressed: () {}, child: Text('Apply'))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _categoryDropDown(
    BuildContext context, FilterCategoryNotifier provider) {
  return Container(
    padding: EdgeInsets.all(10),
    child: DropdownSearch<String>(
      decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
              labelText: 'Category',
              hintText: 'Select a Category',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              prefixIcon: Icon(Icons.category))),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
              labelText: 'Search...',
              border: InputBorder.none,
              constraints: BoxConstraints(maxHeight: 100),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
        ),
      ),
      items: (filter, loadProps) {
        return provider.categoryList
            .map((item) => item.category.toString())
            .toList();
      },
      onChanged: (value) {
        provider.onSelectCategoryValue(value);
        provider.getSubCategoryList(value);
      },
      selectedItem: provider.selectCategorytValue,
    ),
  );
}

Widget _subCategoryDropDown(
    BuildContext context, FilterCategoryNotifier provider) {
  return Container(
    padding: EdgeInsets.all(10),
    child: DropdownSearch<String>.multiSelection(
      key: ValueKey(provider.selectCategorytValue),
      enabled: provider.selectCategorytValue != null,
      decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
              labelText: 'Sub-Category',
              hintText: 'Select a Sub-Category',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              prefixIcon: Icon(Icons.category))),
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: false,
        showSelectedItems: false,
        searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
          labelText: 'Search...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          constraints: BoxConstraints(maxHeight: 200),
        )),
        containerBuilder: (context, popupWidget) {
          return Material(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 8, top: 10),
                        minimumSize: Size(0, 0)),
                    onPressed: () {
                      final allSub =
                          List<String>.from(provider.subCategoryList);
                      provider.updateSelectedSubCategories(allSub);
                      AppNavigator.pop(context);
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 22, 21, 21)),
                    )),
                Divider(),
                Expanded(child: popupWidget)
              ],
            ),
          );
        },
        // onItemAdded: (selectedItems, addedItem) {
        //   final updated = [...selectedItems,addedItem];
        //   provider.updateSelectedSubCategories(updated);
        // },
        // onItemRemoved: (selectedItems, removedItem) {
        //   final updated = [...selectedItems,removedItem];
        //   provider.updateSelectedSubCategories(updated);
        // },
        checkBoxBuilder: (context, item, isDisabled, isSelected) =>
            SizedBox.shrink(),
        itemBuilder: (context, item, isDisabled, isSelected) {
          return InkWell(
            onTap: () {
              final currentList = List<String>.from(provider.selectSubCategories);
              if (isSelected){
                currentList.remove(item);
              } 
              else {
                currentList.add(item);
              }
              provider.updateSelectedSubCategories(currentList);
            },
            child: Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (checked) {
                  final selectedSubList =
                      List<String>.from(provider.selectSubCategories);
                  if (checked == true) {
                    selectedSubList.add(item);
                  } else {
                    selectedSubList.remove(item);
                  }
                  provider.updateSelectedSubCategories(selectedSubList);
                },
              ),
              Text(item)
            ],
          ),
          );
        },
      ),
      // dropdownBuilder: (context, selectedItems) {
      //   return
      // },
      items: (filter, loadProps) {
        return provider.subCategoryList;
      },
      selectedItems: provider.selectSubCategories,
      onChanged: (List<String> values) {
        provider.updateSelectedSubCategories(values);
      },
    ),
  );
}

Widget _brandDropDown(BuildContext context, FilterCategoryNotifier provider) {
  return Container(
    child: Text('B'),
  );
}
