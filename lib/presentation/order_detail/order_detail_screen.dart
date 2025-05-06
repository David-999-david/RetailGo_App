import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/presentation/active_screen/active_screen.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';
import 'package:retail/presentation/order/order_screen.dart';
import 'package:retail/presentation/order_detail/notifier/order_detail_notifier.dart';
import 'package:retail/presentation/order_detail/widgets/order_summary.dart';
import 'package:retail/presentation/order_detail/widgets/payment_detail.dart';
import 'package:retail/presentation/order_detail/widgets/receiver_info.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final orderNotifier = context.watch<OrderNotifier>();
    // bool isCompleted = order.status == 'Completed';
    // return ChangeNotifierProvider(
    //   create: (context) =>
    //       OrderDetailNotifier(orderModel: order)..getOrderItems(),
    //   child: Consumer<OrderDetailNotifier>(
    //     builder: (context, provider, child) {
    //       return Scaffold(
    //         appBar: _appBar(context, order),
    //         body: Container(
    //           padding: EdgeInsets.all(20),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text('Receiver Info',
    //                     style: TextStyle(
    //                         fontSize: 17, fontWeight: FontWeight.w600)),
    //                 SizedBox(
    //                   height: 13,
    //                 ),
    //                 ReceiverInfo(
    //                   order: order,
    //                 ),
    //                 // OrderSummary(
    //                 //   order: order,
    //                 //   isCompleted: isCompleted,
    //                 // ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 Divider(
    //                   height: 1,
    //                   color: Colors.black,
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 Text('Order Summary',
    //                     style: TextStyle(
    //                         fontSize: 17, fontWeight: FontWeight.w600)),
    //                 SizedBox(
    //                   height: 13,
    //                 ),
    //                 SizedBox(
    //                     width: double.infinity,
    //                     child: Column(
    //                       children: provider.orderItemList.map((item) {
    //                         return OrderSummary(order: item);
    //                       }).toList(),
    //                     )),
    //                 SizedBox(
    //                   height: 2,
    //                 ),
    //                 PaymentDetail(order: order)
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    return ChangeNotifierProvider(
      create: (context) =>
          OrderDetailNotifier(orderModel: order)..getOrderItems(),
      child: Consumer<OrderDetailNotifier>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: _appBar(context),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 18, right: 15, left: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 7, bottom: 10, right: 14, left: 14),
                        width: double.infinity,
                        height: 445,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 184, 184, 184)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _orderDetailTable(context, order, orderNotifier),
                              Divider(),
                              OrderSummary(orderItems: provider.orderItemList)
                            ],
                          ),
                        )),
                        SizedBox(height: 12,),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color.fromARGB(255, 184, 184, 184),
                            ),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReceiverInfo(order: order),
                              Divider(),
                              PaymentDetail(order: order)
                            ],
                          ),
                        )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(
      'Order Detail',
      style: TextStyle(
          fontSize: 26, color: Colors.black, fontWeight: FontWeight.w500),
    ),
    leading: IconButton(onPressed: (){
      AppNavigator.push(context, ActiveScreen(pageIndex: 2,));

    }, icon: Icon(Icons.arrow_back)),
  );
}

Table _orderDetailTable(
    BuildContext context, OrderModel order, OrderNotifier notifier) {
  return Table(
    columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(1)},
    children: [
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Text(
            'Order #${order.orderId.toString()}',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Chip(
            label: Text(order.paymentStatus),
            labelPadding: EdgeInsets.zero,
            backgroundColor: notifier.statusColor(order.paymentStatus),
          ),
        ),
      ]),
      TableRow(children: [
        Text(
          order.formateDAte2,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
        ),
        SizedBox.shrink()
      ])
    ],
  );
}
