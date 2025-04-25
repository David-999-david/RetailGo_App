import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/data/order/remote/order_remote.dart';

class OrderRespository {
  Future<List<OrderModel>> getAllOrders() {
    return OrderRemote().getAllOrder();
  }
}
