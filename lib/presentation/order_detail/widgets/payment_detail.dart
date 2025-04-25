import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {0: FlexColumnWidth(2.5), 1: FlexColumnWidth(2)},
      children: [_tablerow('Total Price', order.totalPrice.toStringAsFixed(2))],
    );
  }
}

TableRow _tablerow(String label, String value) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w500),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        value,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    )
  ]);
}
