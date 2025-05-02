import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/place_order/order_item_table.dart';

class OrderItemBox extends StatelessWidget {
  const OrderItemBox({super.key});

  @override
  Widget build(BuildContext context) {
    final orderNoti = context.watch<ConfirmOrderNotifier>()..getAllOrderList();
    if (orderNoti.orderList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final order = orderNoti.orderList.first;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order #${order.orderId.toString()}',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            OrderItemTable(
              orderItemList: order.items,
              totalPrice: order.totalPrice,
            ),
          ],
        ),
      );
    }
  }
}
