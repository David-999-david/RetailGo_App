import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/domain/order/repository/order_respository.dart';

class GetAllOrdersUseCase {
  Future<List<OrderModel>> getAllOrders() async {
    return await OrderRespository().getAllOrders();
  }
}
