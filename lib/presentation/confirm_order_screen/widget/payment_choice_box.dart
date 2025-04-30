import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/domain/enums/payment_method.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class PaymentChoiceBox extends StatelessWidget {
  const PaymentChoiceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier()..getAllcartList(),
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
          bool onSelectedOnline =
              provider.selectedMethod == PaymentMethod.onlinePayment;
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 87,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color.fromARGB(255, 184, 184, 184)),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                          label: Text(
                            'Cash On Delivery',
                            style: TextStyle(fontSize: 17),
                          ),
                          icon: Icon(
                            Icons.local_shipping_outlined,
                            size: 50,
                            color:
                                onSelectedOnline ? Colors.black : Colors.white,
                          )),
                      ButtonSegment(
                          value: PaymentMethod.onlinePayment,
                          label: Text(
                            'Online Payment',
                            style: TextStyle(fontSize: 17),
                          ),
                          icon: Icon(
                            Icons.credit_card,
                            size: 50,
                            color:
                                onSelectedOnline ? Colors.white : Colors.black,
                          ))
                    ],
                    selected: {provider.selectedMethod},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                        backgroundColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.blue.shade600;
                        }
                        return Colors.white30;
                      },
                    ), foregroundColor:
                            WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.white;
                      }
                      return Colors.black87;
                    })),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (onSelectedOnline){}
                    else {}
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(380, 60),
                      elevation: 0,
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                          textStyle: TextStyle(
                            fontSize: 20
                          )
                          ),
                  child: !onSelectedOnline
                      ? Text('Place Order')
                      : Text('Make Payment \$${provider.totalPrice}'))
            ],
          );
        },
      ),
    );
  }
}
