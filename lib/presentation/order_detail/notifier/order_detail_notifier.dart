import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';

class OrderDetailNotifier extends ChangeNotifier {
  OrderModel orderModel;

  OrderDetailNotifier({required this.orderModel});

  List<OrderItemModel> _orderItemList = [];

  List<OrderItemModel> get orderItemList => _orderItemList;

  void getOrderItems() {
    _orderItemList = List.from(orderModel.items);
    notifyListeners();
  }
}
