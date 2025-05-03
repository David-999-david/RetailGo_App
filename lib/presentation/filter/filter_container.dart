import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/filter/notifier/filter_category_notifier.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:retail/presentation/search_screen.dart/notifier/search_screen_provider.dart';
import 'package:retail/presentation/search_screen.dart/search_screen.dart';

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
            height: MediaQuery.of(context).size.height * 0.45,
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
                    height: 10,
                  ),
                  _categoryDropDown(context, provider),
                  SizedBox(
                    height: 10,
                  ),
                  _subCategoryDropDown(context, provider),
                  SizedBox(
                    height: 20,
                  ),
                  _brandDropDown(context, provider),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            provider.clearAllFilter();
                          },
                          child: Text('Clear')),
                      ElevatedButton(onPressed: () {
                        provider.getAllFilterList();
                        Provider.of<SearchScreenProvider>(context,listen: false).setFilterList(provider.getAllFilterList());
                        AppNavigator.pop(context)
;                      }, child: Text('Apply'))
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
        constraints: BoxConstraints(maxHeight: 280),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
              labelText: 'Search...',
              border: InputBorder.none,
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
        constraints: BoxConstraints(maxHeight: 280),
        showSearchBox: false,
        showSelectedItems: true,
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
                        padding: EdgeInsets.only(left: 32, top: 10),
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
          return ListTile(
              onTap: () {
                final currentList =
                    List<String>.from(provider.selectSubCategories);
                if (isSelected) {
                  currentList.remove(item);
                } else {
                  currentList.add(item);
                }
                provider.updateSelectedSubCategories(currentList);
              },
              leading: Checkbox(
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
              title: Text(item));
        },
      ),
      dropdownBuilder: (context, selectedItems) {
        return Wrap(
          spacing: 5,
          children: selectedItems.map((item) {
            return InputChip(
              label: Text(item),
              deleteIcon: Icon(Icons.clear_outlined),
              onDeleted: () {
                final newList = List<String>.from(selectedItems)..remove(item);
                provider.updateSelectedSubCategories(newList);
              },
            );
          }).toList(),
        );
      },
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
    padding: EdgeInsets.all(10),
    child: DropdownSearch<String>(
      decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
              labelText: 'Brand',
              hintText: 'Select a Brand',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              prefixIcon: Icon(Icons.store_mall_directory_outlined))),
      popupProps: PopupProps.menu(
          showSearchBox: true,
          constraints: BoxConstraints(maxHeight: 280),
          searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  labelText: 'Search...',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 6)))),
      items: (filter, loadProps) {
        return provider.brandList;
      },
      onChanged: (value) {
        provider.onSelectBrand(value);
      },
      selectedItem: provider.selectBrand,
    ),
  );
}
