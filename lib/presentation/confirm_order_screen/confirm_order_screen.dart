import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/cart/notifier/cart_list_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/cart_items_show.dart';
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
            ..getAllAddress(),
        ),
        ChangeNotifierProvider(
            create: (context) => CartListNotifier()..getAllCart())
        // ChangeNotifierProvider(create: (context) => StripePaymentNotifier()
        // )
      ],
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: _appBar(context, provider),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LocationBox(),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CartItemsShow(),
                        SizedBox.shrink(),
                        PriceBox(),
                        SizedBox(
                          height: 5,
                        ),
                        PaymentChoiceBox(),
                        SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ))
                ],
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
