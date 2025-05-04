import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';
import 'package:retail/presentation/order/widgets/order_item.dart';
import 'package:retail/presentation/order/widgets/order_status_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderNotifier()..getAllOrders(),
      child: Consumer<OrderNotifier>(
        builder: (context, provider, child) {
          final orders = provider.ordersList;
          return Scaffold(
            appBar: _appBar(context),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return OrderStatusItem(
                                status: provider.statusList[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 7,
                            );
                          },
                          itemCount: provider.statusList.length),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 380,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            final currentDate = order.formatDate;
                            final lastDate =
                                index > 0 ? orders[index - 1].formatDate : '';
                            final bool showDate = currentDate != lastDate;
                            return OrderItem(
                              order: order,
                              showDate: showDate,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: orders.length),
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
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'Order History',
      style: TextStyle(
          fontSize: 26, color: Colors.black, fontWeight: FontWeight.w500),
    ),
  );
}
