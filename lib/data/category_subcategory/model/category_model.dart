class CategoryModel {
  final int categoryId;
  final String category;
  final List<SubCategoryModel> subcategory;

  CategoryModel(
      {required this.category,
      required this.subcategory,
      required this.categoryId});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        categoryId: json['category_id'],
        category: json['category_name'] ?? '',
        subcategory: (json['sub_categories'] as List)
            .map((sub) => SubCategoryModel.fromJson(sub))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'category_name': category,
        'sub_categories': subcategory.map((sub) => sub.toJson()).toList()
      };
}

class SubCategoryModel {
  final int subId;
  final String subName;

  SubCategoryModel({required this.subId, required this.subName});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
        subId: json['sub_category_id'], subName: json['sub_category_name']);
  }

  Map<String, dynamic> toJson() =>
      {'sub_category_id': subId, 'sub_category_name': subName};
}
