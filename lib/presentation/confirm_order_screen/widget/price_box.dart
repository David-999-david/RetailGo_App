import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/confirm_order_screen/notifier/confirm_order_notifier.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConfirmOrderNotifier>();
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(color: Color.fromARGB(255, 184, 184, 184)),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                EdgeInsets.only(left: 17, right: 17, top: 10, bottom: 10),
            child: Column(
              children: [
                _priceTable(context, provider),
                Divider(),
                _priceTable2(context, provider)
              ],
            ),
          ),
        );

  }
}

Table _priceTable(BuildContext context, ConfirmOrderNotifier provider) {
  return Table(
    columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
    children: [
      _priceTableRow(
          'Sub-Total', '\$${(provider.subTotal).toStringAsFixed(2)}'),
      _priceTableRow(
          'Discount', '\$${(provider.discountTotal).toStringAsFixed(2)}')
    ],
  );
}

TableRow _priceTableRow(String label, String price) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: Text(
        label,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: Text(
        price,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      ),
    )
  ]);
}

Table _priceTable2(BuildContext context, ConfirmOrderNotifier provider) {
  return Table(
    columnWidths: {0: FlexColumnWidth(), 1: FlexColumnWidth()},
    children: [
      _priceTableRow2(
          'Total', '\$${(provider.totalPrice).toStringAsFixed(2)}')
    ],
  );
}

TableRow _priceTableRow2(String label, String price) {
  return TableRow(children: [
    Text(
      label,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    Text(
      price,
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    )
  ]);
}
