import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {0: FlexColumnWidth(2.5), 1: FlexColumnWidth(2)},
      children: [
        _tablerow('Total Amount', '\$${order.totalPrice.toStringAsFixed(2)}')
      ],
    );
  }
}

TableRow _tablerow(String label, String value) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            // Colors.grey[600],
            fontWeight: FontWeight.w500),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        value,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    )
  ]);
}
