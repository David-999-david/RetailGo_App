// import 'package:flutter/material.dart';

// class CartListPage extends StatelessWidget {
//   const CartListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Cart"),
//       ),
//       body: ListView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Product Image
//                 Image.asset(
//                   "assets/images/shirt.png",
//                   height: 100,
//                 ),
//                 const SizedBox(width: 10),
//                 // Product Details
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Product Name with Edit Icon
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "Zipper Hoodie",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: () {}, // Add your edit function here
//                             icon: const Icon(Icons.edit,
//                                 size: 25, color: Colors.black),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: const [
//                           Icon(Icons.alarm, size: 20),
//                           SizedBox(width: 5),
//                           Text("02/01/2025"),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               color: Colors.grey[200],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _buildQuantityButton(Icons.remove),
//                                 const SizedBox(width: 10),
//                                 const Text("1"),
//                                 const SizedBox(width: 10),
//                                 _buildQuantityButton(Icons.add),
//                               ],
//                             ),
//                           ),
//                           const Spacer(),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 10),
//                             child: Text(
//                               "943.7",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.right,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildQuantityButton(IconData icon) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         height: 30,
//         width: 30,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Icon(icon, size: 18, color: Colors.black),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/presentation/cart/notifier/cart_list_notifier.dart';
import 'package:retail/presentation/cart/widgets/cart_item.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartListNotifier()..getAllCart(),
      child: Consumer<CartListNotifier>(
        builder: (context, notifier, child) {
          return Scaffold(
            appBar: cartAppBar(context),
            body: ListView.builder(
              itemCount: notifier.cartList.length,
              itemBuilder: (context, index) {
                CartModel cart = notifier.cartList[index];
                return
                    // Container(
                    //   margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                    //   padding: const EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.white,
                    //   ),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       // Product Image
                    //       Image.network(
                    //         cart.featuredImage,
                    //         height: 100,
                    //       ),
                    //       const SizedBox(width: 10),
                    //       // Product Details
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             // Product Name with Edit Icon
                    //             Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: Text(
                    //                     cart.name,
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                 ),
                    //                 IconButton(
                    //                   onPressed: () {},
                    //                   icon: const Icon(Icons.edit,
                    //                       size: 25, color: Colors.black),
                    //                 ),
                    //               ],
                    //             ),
                    //             Row(
                    //               children: const [
                    //                 Icon(Icons.alarm, size: 20),
                    //                 SizedBox(width: 5),
                    //                 Text("02/01/2025"),
                    //               ],
                    //             ),
                    //             const SizedBox(height: 5),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   padding: const EdgeInsets.all(10),
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(15),
                    //                     color: Colors.grey[200],
                    //                   ),
                    //                   child: Row(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       _buildQuantityButton(
                    //                         Icons.remove,
                    //                         onTap: () =>
                    //                             notifier.qtyChange(cart, 0),
                    //                       ),
                    //                       const SizedBox(width: 10),
                    //                       Text(cart.qty.toString()),
                    //                       const SizedBox(width: 10),
                    //                       _buildQuantityButton(
                    //                         Icons.add,
                    //                         onTap: () =>
                    //                             notifier.qtyChange(cart, 1),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 const Spacer(),
                    //                 const Padding(
                    //                   padding: EdgeInsets.only(top: 10),
                    //                   child: Text(
                    //                     "943.7",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold),
                    //                     textAlign: TextAlign.right,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                    CartItem(cart: cart);
              },
            ),
          );
        },
      ),
    );
  }
}

AppBar cartAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () => AppNavigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios,
      ),
    ),
    title: Text("Cart"),
  );
}
