import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      
      _ordersList.sort((a,b){
        final da = DateFormat.yMMM().parse(a.formatDate);
        final db = DateFormat.yMMM().parse(b.formatDate);
        return db.compareTo(da);
      });
      _filterList = List.from(_ordersList);
      _statusList = _ordersList.isNotEmpty
          ? _ordersList.map((order) => order.orderStatus).toSet().toList()
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
          _ordersList.where((order) => order.orderStatus == status).toList();
      notifyListeners();
    }
  }

  Color statusColor(String paymentStatus){
    switch (paymentStatus){
      case 'Processing' : return Colors.amber.shade100;
      case 'Paid' : return Colors.lightBlue.shade100 ;
      case 'Unpaid' : return Colors.lightGreen.shade100 ;
      case 'Pending' : return Colors.redAccent.shade100 ;
      case 'Refunded' : return Colors.limeAccent.shade100 ;
      default : return Colors.grey.shade100;
    }
  }
}
