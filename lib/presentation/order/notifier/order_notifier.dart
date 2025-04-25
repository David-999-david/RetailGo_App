import 'package:flutter/material.dart';
import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/domain/order/usecase/order_usecase.dart';

class OrderNotifier extends ChangeNotifier {
  List<OrderModel> _ordersList = [];
  List<OrderModel> _filterList = [];
  List<String> _statusList = [];
  String _selectedStatus = 'All';

  List<OrderModel> get ordersList => _filterList;
  List<String> get statusList => _statusList;
  String get selectedStatus => _selectedStatus;

  void getAllOrders() async {
    try {
      _ordersList = await GetAllOrdersUseCase().getAllOrders();
      _filterList = List.from(_ordersList);
      _statusList = _ordersList.isNotEmpty
          ? _ordersList.map((order) => order.status).toSet().toList()
          : [];
      _statusList.insert(0, 'All');
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void filterByStatus(String status) {
    _selectedStatus = status;
    if (status == 'All') {
      _filterList = List.from(_ordersList);
      notifyListeners();
    } else {
      _filterList =
          _ordersList.where((order) => order.status == status).toList();
      notifyListeners();
    }
  }
}
