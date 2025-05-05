// import 'package:flutter/material.dart';
// import 'package:retail/data/order/model/order_model.dart';

// class OrderDetailItem extends StatelessWidget {
//   const OrderDetailItem({super.key, required this.orderItem});

//   final OrderItemModel orderItem;

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       columnWidths: {0: FlexColumnWidth(3), 2: FlexColumnWidth(1.5)},
//       children: [
//         TableRow(children: [
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 5),
//             child: Text(
//               orderItem.sku,
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 5),
//             child: Text(orderItem.quantity.toString(),
//                 style: TextStyle(fontSize: 16)),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 5),
//             child: Text(
//               orderItem.orderPrice.toStringAsFixed(2),
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.left,
//             ),
//           )
//         ])
//       ],
//     );
//   }
// }
