import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/presentation/cart/notifier/cart_list_notifier.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartListNotifier>(builder: (context, notifier, child) {
      return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            productImage(context, cart),
            const SizedBox(width: 10),
            // Product Details
            productDetils(context, cart, notifier),
          ],
        ),
      );
    });
  }
}

Widget productImage(BuildContext context, CartModel cart) {
  return Image.network(
    cart.featuredImage,
    height: 100,
  );
}

Widget productDetils(
    BuildContext context, CartModel cart, CartListNotifier notifier) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Name with Edit Icon
        Row(
          children: [
            productName(context, cart),
            editCartIcon(context),
          ],
        ),
        cartItemDate(),
        const SizedBox(height: 5),
        cartQuanityController(context, notifier, cart),
      ],
    ),
  );
}

Widget productName(BuildContext context, CartModel cart) {
  return Expanded(
    child: Text(
      cart.name,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget editCartIcon(BuildContext context) {
  return IconButton(
    onPressed: () {},
    icon: const Icon(Icons.edit, size: 25, color: Colors.black),
  );
}

Row cartItemDate() {
  return Row(
    children: const [
      Icon(Icons.alarm, size: 20),
      SizedBox(width: 5),
      Text("02/01/2025"),
    ],
  );
}

Widget cartQuanityController(
    BuildContext context, CartListNotifier notifier, CartModel cart) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildQuantityButton(
              Icons.remove,
              onTap: () => notifier.qtyChange(cart, 0),
            ),
            const SizedBox(width: 10),
            Text(cart.qty.toString()),
            const SizedBox(width: 10),
            _buildQuantityButton(
              Icons.add,
              onTap: () => notifier.qtyChange(cart, 1),
            ),
          ],
        ),
      ),
      const Spacer(),
      const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "943.7",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
      ),
    ],
  );
}

Widget _buildQuantityButton(IconData icon, {void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: 18, color: Colors.black),
    ),
  );
}



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:retail/data/cart/model/cart_model.dart';
// import 'package:retail/presentation/cart/notifier/cart_list_notifier.dart';

// class CartItem extends StatelessWidget {
//   const CartItem({super.key, required this.cart});

//   final CartModel cart;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CartListNotifier>(builder: (context, notifier, child) {
//       return Container(
//         margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Image.network(
//               cart.featuredImage,
//               height: 100,
//             ),
//             const SizedBox(width: 10),
//             // Product Details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Product Name with Edit Icon
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           cart.name,
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.edit,
//                             size: 25, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: const [
//                       Icon(Icons.alarm, size: 20),
//                       SizedBox(width: 5),
//                       Text("02/01/2025"),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.grey[200],
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             _buildQuantityButton(
//                               Icons.remove,
//                               onTap: () => notifier.qtyChange(cart, 0),
//                             ),
//                             const SizedBox(width: 10),
//                             Text(cart.qty.toString()),
//                             const SizedBox(width: 10),
//                             _buildQuantityButton(
//                               Icons.add,
//                               onTap: () => notifier.qtyChange(cart, 1),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Spacer(),
//                       const Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Text(
//                           "943.7",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// Widget _buildQuantityButton(IconData icon, {void Function()? onTap}) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       height: 30,
//       width: 30,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Icon(icon, size: 18, color: Colors.black),
//     ),
//   );
// }

