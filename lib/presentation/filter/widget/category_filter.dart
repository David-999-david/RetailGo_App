// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:retail/data/category_subcategory/model/category_model.dart';
// import 'package:retail/presentation/filter/notifier/filter_category_notifier.dart';

// class CategoryFilter extends StatelessWidget {
//   const CategoryFilter({super.key, required this.category});

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FilterCategoryNotifier>(
//       builder: (context, provider, child) {
//         bool isSelect = provider.selectedCategory == category.category;
//         return GestureDetector(
//           onTap: () {
//             provider.selectCategory(category.category);
//           },
//           // child: Radio(
//           //   value: category.category,
//           //   groupValue: provider.selectedOption,
//           //   onChanged: (value) {
//           //     provider.selectOption(value!);
//           //   },
//           //   activeColor: Colors.blue,
//           //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           // ),
//           child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                   color: isSelect
//                       ? Colors.blue.withOpacity(0.2)
//                       : Colors.grey.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(12)),
//               child: Text(
//                 category.category,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                     color: isSelect ? Colors.blue : Colors.black),
//               )),
//         );
//       },
//     );
//   }
// }
