import 'package:retail/data/category_subcategory/model/category_model.dart';
import 'package:retail/data/category_subcategory/remote/category_remote.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAllCategory() {
    return CategoryRemote().getAllCategory();
  }
}
