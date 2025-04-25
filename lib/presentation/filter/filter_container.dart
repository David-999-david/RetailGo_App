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

// class FilterContainer extends StatelessWidget {
//   const FilterContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => FilterCategoryNotifier()
//         ..getAllCategory()
//         ..getAllProduct(),
//       child:
//           Consumer<FilterCategoryNotifier>(builder: (context, provider, child) {
//         return SingleChildScrollView(
//           child: Container(
//             height: 460,
//             padding: EdgeInsets.all(25),
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.circular(10)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Filtter',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 DropdownButtonFormField(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     menuMaxHeight: 180,
//                     value: provider.selectCategorytValue,
//                     hint: Text('Select Category'),
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey[2000]),
//                     items: provider.categoryList.map((item) {
//                       return DropdownMenuItem(
//                           value: item.category, child: Text(item.category));
//                     }).toList(),
//                     onChanged: (value) {
//                       provider.onSelectCategoryValue(value);
//                       provider.getSubCategoryList(value!);
//                     }),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 SizedBox(
//                   height: 28,
//                   child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return SelectedFilterList(
//                           selectedValue: provider.selectSubCategories[index],
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return SizedBox(
//                           width: 10,
//                         );
//                       },
//                       itemCount: provider.selectSubCategories.length),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 DropdownButtonFormField(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     menuMaxHeight: 200,
//                     value: null,
//                     hint: Text('SUB-Categories'),
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         filled: true,
//                         fillColor: Colors.grey[2000]),
//                     items: provider.subCategoryList.map((item) {
//                       return DropdownMenuItem(
//                           value: item,
//                           child: StatefulBuilder(builder: (context, setState) {
//                             return InkWell(
//                               onTap: () {
//                                 provider.onselectSubCategories(item);
//                                 setState(() {});
//                               },
//                               child: Row(
//                                 children: [
//                                   Checkbox(
//                                       checkColor: Colors.white,
//                                       value: provider.selectSubCategories
//                                           .contains(item),
//                                       onChanged: (value) {
//                                         provider.onselectSubCategories(item);
//                                         setState(() {});
//                                       }),
//                                   Text(item)
//                                 ],
//                               ),
//                             );
//                           }));
//                     }).toList(),
//                     onChanged: (_) {}),
//                 SizedBox(
//                   height: 35,
//                 ),
//                 DropdownButtonFormField(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     menuMaxHeight: 180,
//                     value: provider.selectBrand,
//                     hint: Text('Select Brand'),
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         filled: true,
//                         fillColor: Colors.grey[2000]),
//                     items: provider.brandList.map((brand) {
//                       return DropdownMenuItem(
//                           value: brand,
//                           child:
//                               // Row(
//                               //   children: [
//                               //     Radio(
//                               //         activeColor: Colors.green,
//                               //         value: brand,
//                               //         groupValue: provider.selectBrand,
//                               //         onChanged: (newValue) {
//                               //           provider.onSelectBrand(newValue!);
//                               //           AppNavigator.pop(context);
//                               //         }),
//                               Text(brand)
//                           //   ],
//                           // )
//                           );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       provider.onSelectBrand(newValue);
//                     }),
//                 Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {
//                           provider.clearAllFilter();
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey.shade200,
//                             foregroundColor: Colors.black),
//                         child: Text('Clear Filter')),
//                     ElevatedButton(
//                         onPressed: () {
//                           List<String> allFilterList =
//                               provider.getAllFilterList();

//                           AppNavigator.push(
//                               context,
//                               HomeScreen(
//                                 allFilterList: allFilterList,
//                               ));
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue.withOpacity(0.4),
//                             foregroundColor: Colors.black),
//                         child: Text('Apply Filter')),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

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
              constraints: BoxConstraints
              (maxHeight: MediaQuery.of(context).size.height * 0.3),
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
    child: DropdownSearch.multiSelection(),
  );
}

Widget _brandDropDown(BuildContext context, FilterCategoryNotifier provider) {
  return Container(
    child: Text('B'),
  );
}
