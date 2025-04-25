import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class ReceiverInfo extends StatelessWidget {
  const ReceiverInfo({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Table(
        columnWidths: {0: FlexColumnWidth(2.5), 1: FlexColumnWidth(2)},
        children: [
          _tableRow('Name', 'Mg Hein'),
          _tableRow('Adress', 'Mandalay,ChanMyaTharZi,   73*36*37'),
          _tableRow('Phone No', '+95 942064924'),
          _tableRow('Payment Method', order.paymentMethod)
        ],
      ),
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
