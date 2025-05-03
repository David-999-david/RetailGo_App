import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/stripe_payment_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/cart_items_box.dart';
import 'package:retail/presentation/confirm_order_screen/widget/location_box.dart';
import 'package:retail/presentation/confirm_order_screen/widget/payment_choice_box.dart';
import 'package:retail/presentation/confirm_order_screen/widget/price_box.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier()
        ..getAllcartList()
        ..getAllAddress(),),
        ChangeNotifierProvider(create: (context) => StripePaymentNotifier())
      ],
      child: Consumer2<ConfirmOrderNotifier,StripePaymentNotifier>(
        builder: (context, provider,provider2, child) {
          return Scaffold(
            appBar: _appBar(context, provider),
            body: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LocationBox(),
                      SizedBox(
                        height: 10,
                      ),
                      CartItemsBox(),
                      SizedBox(
                        height: 10,
                      ),
                      PriceBox(),
                      SizedBox(
                        height: 10,
                      ),
                      PaymentChoiceBox(),
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
