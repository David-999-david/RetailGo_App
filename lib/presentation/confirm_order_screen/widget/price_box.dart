import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfirmOrderNotifier()..getAllcartList(),
      child: Consumer<ConfirmOrderNotifier>(
        builder: (context, provider, child) {
          return Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 17, right: 17, top: 20, bottom: 20),
              child: _priceTable(context, provider),
            ),
          );
        },
      ),
    );
  }
}

Table _priceTable(BuildContext context, ConfirmOrderNotifier provider) {
  return Table(
    columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
    children: [
      _priceTableRow('Sub-Total', '\$${(provider.subTotal).toStringAsFixed(2)}'),
      _priceTableRow('Discount', '\$${(provider.discountTotal).toStringAsFixed(2)}')
    ],
  );
}

TableRow _priceTableRow(String label, String price) {
  return TableRow(children: [
    Text(label),
    Text(price,textAlign: TextAlign.right,)
    ]
  );
}
