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
          return Scaffold(
            appBar: _appBar(context),
            body: Padding(
              padding: EdgeInsets.all(10),
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
                              width: 1,
                            );
                          },
                          itemCount: provider.statusList.length),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 370,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return OrderItem(order: provider.ordersList[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: provider.ordersList.length),
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
      'My Orders',
      style: TextStyle(fontSize: 20, color: Colors.black),
    ),
  );
}
