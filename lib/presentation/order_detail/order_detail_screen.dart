import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/presentation/active_screen/active_screen.dart';
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
    // bool isCompleted = order.status == 'Completed';
    return ChangeNotifierProvider(
      create: (context) =>
          OrderDetailNotifier(orderModel: order)..getOrderItems(),
      child: Consumer<OrderDetailNotifier>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: _appBar(context, order),
            body: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Receiver Info',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 13,
                    ),
                    ReceiverInfo(
                      order: order,
                    ),
                    // OrderSummary(
                    //   order: order,
                    //   isCompleted: isCompleted,
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Order Summary',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: provider.orderItemList.map((item) {
                            return OrderSummary(order: item);
                          }).toList(),
                        )),

                    SizedBox(
                      height: 2,
                    ),
                    PaymentDetail(order: order)
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

AppBar _appBar(BuildContext context, OrderModel order) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    leading: IconButton(
        onPressed: () {
          AppNavigator.push(context,ActiveScreen(pageIndex: 2,));
        },
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.grey,
        )),
    centerTitle: true,
    title: Text(
      'Order  #${order.orderId.toString()}',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
  );
}
