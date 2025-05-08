import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/domain/enums/payment_method.dart';
import 'package:retail/presentation/cart/notifier/cart_list_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';
import 'package:retail/presentation/confirm_order_screen/widget/place_order/order_success_sheet.dart';

class PaymentChoiceBox extends StatelessWidget {
  const PaymentChoiceBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();
    final cart = context.watch<CartListNotifier>();
    // final stripeProvider = context.watch<StripePaymentNotifier>();

    bool onSelectedOnline =
        provider.selectedMethod == PaymentMethod.onlinePayment;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: SegmentedButton(
              multiSelectionEnabled: false,
              showSelectedIcon: false,
              direction: Axis.horizontal,
              onSelectionChanged: (newMethod) {
                provider.selectMethod(newMethod.first);
              },
              segments: [
                ButtonSegment(
                    value: PaymentMethod.cashOnDelivery,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_shipping_outlined,
                        size: 33,
                        color: onSelectedOnline ? Colors.black : Colors.white,
                        ),SizedBox(width: 17,),
                        
                        Flexible(
                          child: Text('Cash On Delivery',
                          softWrap: true,
                          style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    )
                    ),
                ButtonSegment(
                    value: PaymentMethod.onlinePayment,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.credit_card,
                        size: 33,
                        color: onSelectedOnline ? Colors.white : Colors.black,
                        ),
                        SizedBox(width: 8,),
                        Flexible(
                          child: Text('Online Payment',
                          softWrap: true,
                          style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    )
                    )
              ],
              selected: {provider.selectedMethod},
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStateProperty.resolveWith(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.blue.shade600;
                      }
                      return Colors.white30;
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return Colors.black87;
                  })),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
            onPressed: () async {
              if (onSelectedOnline) {
                // final bool paid =
                //     await stripeProvider.makePayment(provider.totalPrice);
                // if (paid) {
                //   provider.placeOrder(
                //       context,
                //       ChangeNotifierProvider.value(
                //         value: provider,
                //         child: OrderSuccessScreen(),
                //       ));
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Payment successful....')));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Payment failded....')));
                // }
              } else {
                provider.placeOrder(
                    context,
                    ChangeNotifierProvider.value(
                      value: provider,
                      child: OrderSuccessScreen(
                        totalAmount: provider.subTotal,
                      ),
                    ));
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(380, 45),
                elevation: 0,
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                side: BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textStyle: TextStyle(fontSize: 20)),
            child: !onSelectedOnline
                ? Text('Place Order',style: TextStyle(fontSize: 18),)
                : Text(
                    'Make Payment \$${provider.subTotal.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                  ))
      ],
    );
  }
}
