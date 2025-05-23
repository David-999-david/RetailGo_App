import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/domain/cart/repository/cart_repo.dart';

class CartUsecase {
  Future<List<CartItem>> getAllCart() async {
    return await CartRepo().getAllCart();
  }
}
