// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:retail/common/constants/local_str.dart';
// import 'package:retail/common/helper/app_navigation.dart';
// import 'package:retail/core/network/storage_utils.dart';
// import 'package:retail/data/home/model/product_model.dart';
// import 'package:retail/presentation/Cart/cart_list.dart';
// import 'package:retail/presentation/home/notifier/home_notifier.dart';
// import 'package:retail/presentation/home/widgets/circular_action_button.dart';
// import 'package:retail/presentation/home/widgets/product_item.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => HomeNotifier()..getAllProduct(),
//       child: Consumer<HomeNotifier>(
//         builder: (context, notifier, child) {
//           return Scaffold(
//             appBar: homeAppBar(context),
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, left: 20),
//                     child: Text(
//                       "Products",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         top: 10, left: 10, bottom: 10, right: 10),
//                     child: GridView.count(
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       childAspectRatio: 0.8,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 5,
//                       mainAxisSpacing: 10,
//                       children:
//                           List.generate(notifier.productList.length, (index) {
//                         ProductModel product = notifier.productList[index];
//                         return
//                             // Container(
//                             //   padding: EdgeInsets.all(10),
//                             //   decoration: BoxDecoration(
//                             //     color: Colors.white,
//                             //     borderRadius: BorderRadius.circular(10),
//                             //   ),
//                             //   child: Column(
//                             //     mainAxisAlignment: MainAxisAlignment.center,
//                             //     crossAxisAlignment: CrossAxisAlignment.center,
//                             //     children: [
//                             //       Image.network(
//                             //         product.featuredImage,
//                             //         height: 100,
//                             //       ),
//                             //       Row(
//                             //         children: [
//                             //           Expanded(
//                             //             child: Text(
//                             //               product.name,
//                             //               style: TextStyle(
//                             //                 color: Colors.black,
//                             //                 fontWeight: FontWeight.w600,
//                             //                 fontSize: 15,
//                             //               ),
//                             //               overflow: TextOverflow.ellipsis,
//                             //               textAlign: TextAlign.left,
//                             //             ),
//                             //           ),
//                             //         ],
//                             //       ),
//                             //       SizedBox(
//                             //         height: 5,
//                             //       ),
//                             //       Row(
//                             //         mainAxisAlignment: MainAxisAlignment.start,
//                             //         children: [
//                             //           Text(
//                             //             product.basePrice,
//                             //             style: TextStyle(
//                             //               color: Colors.black,
//                             //               fontWeight: FontWeight.w700,
//                             //               fontSize: 14,
//                             //             ),
//                             //           ),
//                             //           SizedBox(
//                             //             width: 5,
//                             //           ),
//                             //           Text(
//                             //             product.basePrice,
//                             //             style: TextStyle(
//                             //               color: Colors.black,
//                             //               fontWeight: FontWeight.w400,
//                             //               fontSize: 12,
//                             //               decoration: TextDecoration.lineThrough,
//                             //             ),
//                             //           ),
//                             //         ],
//                             //       ),
//                             //       SizedBox(
//                             //         height: 10,
//                             //       ),
//                             //       Row(
//                             //         mainAxisAlignment:
//                             //             MainAxisAlignment.spaceBetween,
//                             //         children: [
//                             //           Row(
//                             //             children: [
//                             //               Icon(
//                             //                 Icons.alarm,
//                             //                 size: 15,
//                             //                 color: Colors.grey[400],
//                             //               ),
//                             //               Text(
//                             //                 "02/02/2025",
//                             //                 style: TextStyle(
//                             //                   color: Colors.grey[400],
//                             //                   fontWeight: FontWeight.w600,
//                             //                   fontSize: 13,
//                             //                 ),
//                             //                 textAlign: TextAlign.left,
//                             //               ),
//                             //             ],
//                             //           ),
//                             //           GestureDetector(
//                             //             onTap: () => notifier.addToCart(product),
//                             //             child: Container(
//                             //               width: 30,
//                             //               height: 30,
//                             //               decoration: BoxDecoration(
//                             //                 borderRadius: BorderRadius.circular(50),
//                             //                 color: Colors.grey[200],
//                             //               ),
//                             //               child: Center(
//                             //                 child: Icon(
//                             //                   Icons.shopping_cart_outlined,
//                             //                   size: 18,
//                             //                   color: Colors.black,
//                             //                 ),
//                             //               ),
//                             //             ),
//                             //           ),
//                             //         ],
//                             //       ),
//                             //     ],
//                             //   ),
//                             // );
//                             ProductItem(product: product);
//                       }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // AppBar homeAppBar(BuildContext context) {
// //   return AppBar(
// //     automaticallyImplyLeading: false,
// //     title: Row(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: [
// //         GestureDetector(
// //           onTap: () => StorageUtils.remove(LocalStr.addToCartList),
// //           child: Container(
// //             width: 40,
// //             height: 40,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(50),
// //               color: Colors.grey[300],
// //             ),
// //             child: Center(
// //               child: Text(
// //                 "H",
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.w400,
// //                   fontSize: 18,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //         SizedBox(
// //           width: 10,
// //         ),
// //         Text(
// //           "Htet Oo Ko",
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontWeight: FontWeight.w600,
// //             fontSize: 20,
// //           ),
// //         ),
// //       ],
// //     ),
// //     actions: [
// //       GestureDetector(
// //         onTap: () => AppNavigator.push(context, CartListPage()),
// //         child: Container(
// //           width: 40,
// //           height: 40,
// //           margin: EdgeInsets.only(right: 10),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(50),
// //             color: Colors.grey[200],
// //           ),
// //           child: Center(
// //             child: Icon(
// //               Icons.shopping_cart_outlined,
// //               size: 18,
// //               color: Colors.black,
// //             ),
// //           ),
// //         ),
// //       ),
// //     ],
// //   );
// // }

// // AppBar homeAppBar1(BuildContext context) {
// //   return AppBar(
// //     automaticallyImplyLeading: false,
// //     title: Row(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: [
// //         GestureDetector(
// //           onTap: () => StorageUtils.remove(LocalStr.addToCartList),
// //           child: Container(
// //             width: 40,
// //             height: 40,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(50),
// //               color: Colors.grey[300],
// //             ),
// //             child: Center(
// //               child: Text(
// //                 "H",
// //                 style: TextStyle(
// //                   fontWeight: FontWeight.w400,
// //                   fontSize: 18,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //         SizedBox(
// //           width: 10,
// //         ),
// //         Text(
// //           "Htet Oo Ko",
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontWeight: FontWeight.w600,
// //             fontSize: 20,
// //           ),
// //         ),
// //       ],
// //     ),
// //     actions: [
// //       GestureDetector(
// //         onTap: () => AppNavigator.push(context, CartListPage()),
// //         child: Container(
// //           width: 40,
// //           height: 40,
// //           margin: EdgeInsets.only(right: 10),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(50),
// //             color: Colors.grey[200],
// //           ),
// //           child: Center(
// //             child: Icon(
// //               Icons.shopping_cart_outlined,
// //               size: 18,
// //               color: Colors.black,
// //             ),
// //           ),
// //         ),
// //       ),
// //     ],
// //   );
// // }

// AppBar homeAppBar(BuildContext context) {
//   return AppBar(
//     automaticallyImplyLeading: false,
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CircularActionButton(
//           onTap: () => StorageUtils.remove(LocalStr.addToCartList),
//           color: Colors.grey[300]!,
//           hSize: 40,
//           wSize: 40,
//           child: Text(
//             "H",
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 18,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Text(
//           "Htet Oo Ko",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//             fontSize: 20,
//           ),
//         ),
//       ],
//     ),
//     actions: [
//       CircularActionButton(
//         onTap: () => AppNavigator.push(context, CartListPage()),
//         color: Colors.grey[200]!,
//         hSize: 40,
//         wSize: 40,
//         margin: EdgeInsets.only(right: 10),
//         child: Icon(
//           Icons.shopping_cart_outlined,
//           size: 18,
//           color: Colors.black,
//         ),
//       )
//     ],
//   );
// }
