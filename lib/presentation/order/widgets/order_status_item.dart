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
      labelStyle: TextStyle(
        color: activeStatu ? Colors.white : Colors.black
      ),
      selected: status == provider.selectedStatus,
      onSelected: (value) {
        provider.filterByStatus(status);
      },
      selectedColor: Color(0xFF00BFA6),
      backgroundColor: Colors.white,
      );
  }
}
