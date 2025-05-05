import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';
import 'package:retail/presentation/order_detail/order_detail_screen.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order, required this.showDate});

  final OrderModel order;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrderNotifier>();
    return GestureDetector(
        onTap: () {
          AppNavigator.push(context, ChangeNotifierProvider.value(
            value: Provider.of<OrderNotifier>(context,listen: false),
            child: OrderDetailScreen(order: order),
            ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showDate)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Text(
                  order.formatDate,
                  style: TextStyle(fontSize: 19),
                ),
              ),
            Container(
                padding:
                    EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    _tableRow(order, provider),
                    _tableRow1('Order #${order.orderId}'),
                    _tableRow2(order.formateDAte2),
                    _tableRow2(order.address)
                  ],
                )),
          ],
        ));
  }
}

TableRow _tableRow(OrderModel order, OrderNotifier provider) {
  return TableRow(children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Chip(
          label: Text(
            order.paymentStatus,
          ),
          labelPadding: EdgeInsets.zero,
          labelStyle: TextStyle(
            fontSize: 14,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5),
          backgroundColor: provider.statusColor(order.paymentStatus),
        ),
      ),
    ),
    Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, right: 10),
          child: Text(
            '\$${order.totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ))
  ]);
}

TableRow _tableRow1(String value) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.only(left: 8,bottom: 4,top: 3),
      child: Text(
        value,
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    ),
    SizedBox.shrink()
  ]);
}

TableRow _tableRow2(String value) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.only(left: 8,top: 3,bottom: 5),
      child: Text(value,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.black,fontSize: 15),),
    ),
    SizedBox.shrink()
  ]);
}
