// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:retail/presentation/filter/notifier/filter_category_notifier.dart';

// class SubcategoryFilter extends StatelessWidget {
//   const SubcategoryFilter({super.key, required this.subcategory});

//   final String subcategory;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FilterCategoryNotifier>(
//       builder: (context, provider, child) {
//         bool isSelect = provider.selectedSubCategory == subcategory;
//         return GestureDetector(
//             onTap: () {
//               provider.selectSub(subcategory);
//             },
//             child: AnimatedContainer(
//               height: 50,
//               width: double.infinity,
//               padding: EdgeInsets.all(8),
//               duration: Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               decoration: BoxDecoration(
//                 color: isSelect
//                     ? Colors.blue.withOpacity(0.2)
//                     : Colors.grey.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 subcategory,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: isSelect ? Colors.blue : Colors.black),
//               ),
//             ));
//       },
//     );
//   }
// }
