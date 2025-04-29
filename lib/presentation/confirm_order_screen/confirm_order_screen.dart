import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/cart_items_box.dart';
import 'package:retail/presentation/confirm_order_screen/widget/location_box.dart';
import 'package:retail/presentation/confirm_order_screen/widget/price_box.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier()..getAllcartList(),
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: _appBar(context, provider),
            body: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 8),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LocationBox(),
                      SizedBox(
                        height: 16,
                      ),
                      CartItemsBox(),
                      SizedBox(height: 20,),
                      PriceBox()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

AppBar _appBar(BuildContext context, ConfirmOrderNotifier provider) {
  return AppBar(
    title: Text(
      'Confirm Order',
      style: TextStyle(color: Colors.black, fontSize: 25),
    ),
    centerTitle: true,
  );
}
