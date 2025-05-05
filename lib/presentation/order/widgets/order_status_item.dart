import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrderNotifier>();
    final bool activeStatu = status == provider.selectedStatus;
    return ChoiceChip(
      showCheckmark: false,
      label: Text(status),
      labelPadding: EdgeInsets.symmetric(horizontal: 5),
      labelStyle: TextStyle(
        color: activeStatu ? Colors.black : Colors.black
      ),
      selected: status == provider.selectedStatus,
      onSelected: (value) {
        provider.filterByStatus(status);
      },
      selectedColor: Colors.lightBlue.shade200,
      backgroundColor: Colors.white,
      );
  }
}
