class CartModel {
  final String productId;
  final String name;
  final String description;
  final String brand;
  final String discount;
  final String status;
  final String basePrice;
  final String categoryName;
  final String subCategoryName;
  final String featuredImage;
  int qty;

  CartModel({
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
    this.qty = 1,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json["product_id"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      brand: json["brand"] ?? "",
      discount: json["discount"] ?? "",
      status: json["status"] ?? "",
      basePrice: json["base_price"] ?? "",
      categoryName: json["category_name"] ?? "",
      subCategoryName: json["sub_category_name"] ?? "",
      featuredImage: json["featured_image"] ??
          "http://res.cloudinary.com/dilt44xas/image/upload/v1741160668/retailGo/ln2uqf4uvnuttmk3e6zt.webp",
      qty: json['qty'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "brand": brand,
        "discount": discount,
        "status": status,
        "base_price": basePrice,
        "category_name": categoryName,
        "sub_category_name": subCategoryName,
        "featured_image": featuredImage,
        "qty": qty,
      };
}
