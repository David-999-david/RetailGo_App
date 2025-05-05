import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class ReceiverInfo extends StatelessWidget {
  const ReceiverInfo({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Receiver Information',
          style: TextStyle(
              fontSize: 21, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Mg Hein',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '+959 843409349',
          softWrap: true,
          maxLines: 2,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          order.address,
          softWrap: true,
          maxLines: 2,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ],
    );
  }
}
