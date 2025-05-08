class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  final String imageUrl;
  final List<Attribute> attributes;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.attributes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'attributes': attributes.map((attr) => attr.toJson()).toList(),
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      imageUrl: json['imageUrl'],
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((attr) => Attribute.fromJson(attr))
              .toList() ??
          [],
    );
  }
}

class Attribute {
  final int attributeId;
  final String name;
  final String value;

  Attribute({
    required this.attributeId,
    required this.name,
    required this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        attributeId: json['attribute_id'] is int
            ? json['attribute_id']
            : int.tryParse(json['attribute_id'].toString()) ?? 0,
        name: json['name'].toString(),
        value: json['value'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'attribute_id': attributeId,
        'name': name,
        'value': value,
      };
}
