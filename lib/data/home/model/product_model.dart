import 'package:retail/data/cart/model/cart_model.dart';

class ProductModel {
  final String  productId;
  final String  name;
  final String  description;
  final String  brand;
  final double  discount;
  final String  status;
  final double  basePrice;
  final String  categoryName;
  final String  subCategoryName;
  final String  featuredImage;
  final List<Attribute> attributes;

  ProductModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.brand,
    required this.discount,
    required this.status,
    required this.basePrice,
    required this.categoryName,
    required this.subCategoryName,
    required this.featuredImage,
    required this.attributes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId:      json["product_id"]?.toString()      ?? "",
      name:           json["name"]?.toString()            ?? "",
      description:    json["description"]?.toString()     ?? "",
      brand:          json["brand"]?.toString()           ?? "",
      discount:       double.tryParse(json["discount"].toString()) ?? 0.0,
      status:         json["status"]?.toString()          ?? "",
      basePrice:      double.tryParse(json["base_price"].toString())  ?? 0.0,
      categoryName:   json["category_name"]?.toString()   ?? "",
      subCategoryName:json["sub_category_name"]?.toString()?? "",
      featuredImage:  json["featured_image"]?.toString()   ?? "",
      attributes: (json['attributes'] as List<dynamic>?)
        ?.map((a) => Attribute.fromJson(a as Map<String, dynamic>))
        .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    "product_id":       productId,
    "name":             name,
    "description":      description,
    "brand":            brand,
    "discount":         discount,
    "status":           status,
    "base_price":       basePrice,
    "category_name":    categoryName,
    "sub_category_name":subCategoryName,
    "featured_image":   featuredImage,
    "attributes":       attributes.map((a) => a.toJson()).toList(),
  };
}
