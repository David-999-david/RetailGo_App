import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.orderItems});

  final List<OrderItemModel> orderItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(1.6),
              2: FlexColumnWidth(1)
            },
            children: [for (var item in orderItems) _tableRow(context, item)],
          ),
        ),
      ],
    );
  }
}

TableRow _tableRow(BuildContext context, OrderItemModel item) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8,right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.cover,
          height: 70,
          width: 30,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8,left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.sku,
            style: TextStyle(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5,),
          Text(
            'Qty: ${item.quantity}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 4,bottom: 8),
      child: Text(
        '\$${item.orderPrice}',
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    )
  ]);
}
