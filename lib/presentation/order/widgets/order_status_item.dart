import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retail/presentation/order/notifier/order_notifier.dart';

class OrderStatusItem extends StatelessWidget {
  const OrderStatusItem({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderNotifier>(
      builder: (context, provider, child) {
        var isSelected = provider.selectedStatus == status;
        return Padding(
          padding: EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              provider.filterByStatus(status);
            },
            child: Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected ? Colors.blue : Colors.grey[200]),
              child: Text(
                status,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: isSelected ? Colors.white : Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
