import 'package:retail/data/category_subcategory/model/category_model.dart';
import 'package:retail/domain/category_subcategory/repository/category_repository.dart';

class CategoryUsecase {
  Future<List<CategoryModel>> getAllCategory() async {
    return await CategoryRepository().getAllCategory();
  }
}
