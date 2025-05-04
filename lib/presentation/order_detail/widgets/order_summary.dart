import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.order});

  final OrderItemModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Table(
            columnWidths: {0: FlexColumnWidth(2.5), 1: FlexColumnWidth(2)},
            children: [
              _tableRow('product name', order.sku),
              _tableRow('price', order.orderPrice.toStringAsFixed(2)),
              _tableRow('quantity', order.quantity.toString())
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          height: 1,
          color: Colors.black,
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}

TableRow _tableRow(String label, String value) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w600),
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
