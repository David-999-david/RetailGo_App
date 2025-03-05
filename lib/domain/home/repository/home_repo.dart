import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/data/home/remote/home_remote.dart';

class HomeRepo {
  Future<List<ProductModel>> getAllProduct() {
    return HomeRemote().getAllProducts();
  }
}
