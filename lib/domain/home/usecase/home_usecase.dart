import 'package:retail/data/home/model/product_model.dart';
import 'package:retail/domain/home/repository/home_repo.dart';

class HomeUsecase {
  Future<List<ProductModel>> getAllProducts() async {
    return await HomeRepo().getAllProduct();
  }
}
