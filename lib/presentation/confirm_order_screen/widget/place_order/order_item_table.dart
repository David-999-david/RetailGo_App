import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class OrderItemTable extends StatelessWidget {
  const OrderItemTable(
      {super.key, required this.orderItemList, required this.totalPrice});

  final List<OrderItemModel> orderItemList;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [_orderTable(context, orderItemList),
              ],
            ),
          ),
        ),
        Divider(),
        _price(context, totalPrice)
      ],
    );
  }
}

Table _orderTable(BuildContext context, List<OrderItemModel> itemList) {
  return Table(
    columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(1)},
    children: itemList.map((item) => _itemRow(context, item)).toList(),
  );
}

TableRow _itemRow(BuildContext context, OrderItemModel item) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(item.productName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text('\$${item.price.toStringAsFixed(2)}',
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)),
    )
  ]);
}

Table _price(BuildContext context, double totalPrice) {
  return Table(
    columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(1)},
    children: [_priceRow(context, 'Total', totalPrice)],
  );
}

TableRow _priceRow(BuildContext context, String label, double value) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(label,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text('\$${value.toStringAsFixed(2)}',
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500)),
    )
  ]);
}
