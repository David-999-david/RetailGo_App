import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';
import 'package:retail/presentation/order_detail/order_detail_screen.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order,required this.showDate});

  final OrderModel order;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrderNotifier>();
    return GestureDetector(
        onTap: () {
          AppNavigator.push(context, OrderDetailScreen(order: order));
        },
        child: Column(
          children: [
            if (showDate) Text(order.formatDate),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13), color: Colors.white),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(1.8),
                    1: FlexColumnWidth(1.2),
                    2: FlexColumnWidth(1.3)
                  },
                  children: [
                    _tableRow1('Order ID', order.orderId.toString(), order.paymentStatus,
                        provider),
                    _tableRow2('Date',
                        '${order.createAt.day.toString().padLeft(2, '0')}-${order.createAt.month.toString().padLeft(2, '0')}-${order.createAt.year}'),
                    _tableRow2('Payment Status', order.paymentStatus),
                    _tableRow2('item', order.itemCounts.toString()),
                    _tableRow2('Total Price', order.totalPrice.toStringAsFixed(2))
                  ],
                )),
          ],
        ));
  }
}

TableRow _tableRow1(
    String label, String value, String orderStatus, OrderNotifier provider) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w600),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        value,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        orderStatus,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: provider.statusColor(orderStatus)),
      ),
    )
  ]);
}

TableRow _tableRow2(String label, String value) {
  return TableRow(children: [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w600),
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        value,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    ),
    SizedBox()
  ]);
}
