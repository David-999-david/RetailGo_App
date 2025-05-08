import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/common/helper/app_navigation.dart';
import 'package:retail/presentation/active_screen/active_screen.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/place_order/order_item_box.dart';
import 'package:retail/presentation/home/home_screen.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';
import 'package:retail/presentation/order_detail/order_detail_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key,required this.totalAmount});

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.only(left: 20, right: 20, top: 25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.green.shade600,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.check_sharp,
              size: 55,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Order Confirmed!',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 15,
          ),
          OrderItemBox(totalAmount: totalAmount,),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(380, 60),
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                AppNavigator.push(context, 
                ChangeNotifierProvider.value(value: OrderNotifier()..getAllOrders(),
                child: OrderDetailScreen(order: provider.orderList.first),
                )
                );
              },
              child: Text(
                'View My Orders',
                style: TextStyle(fontSize: 21),
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                AppNavigator.push(context, ActiveScreen(pageIndex:0,));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green.shade600,
                  fixedSize: Size(380, 60),
                  side: BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                'Continute Shopping',
                style: TextStyle(fontSize: 21),
              ))
        ],
      ),
    );
  }
}
