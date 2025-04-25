class OrderModel {
  final int orderId;
  final String status;
  final String paymentStatus;
  final String paymentMethod;
  final int itemsCount;
  final double totalPrice;
  final DateTime createdAt;
  final List<OrderItemModel> items;

  OrderModel(
      {required this.orderId,
      required this.status,
      required this.paymentStatus,
      required this.paymentMethod,
      required this.itemsCount,
      required this.totalPrice,
      required this.createdAt,
      required this.items});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<OrderItemModel> items = (json['order_items'] as List ?? [])
        .map((item) => OrderItemModel.fromJson(item))
        .toList();

    return OrderModel(
        orderId: json['order_id'] ?? 0,
        status: json['status'] ?? 'Unknown',
        paymentStatus: json['payment_status'] ?? 'Unknown',
        paymentMethod: json['payment_method'] ?? 'Unknown',
        itemsCount: items.fold(0, (sum, item) => sum + item.quantity),
        totalPrice: (json['total_price'] ?? 0.0).toDouble(),
        createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
            DateTime(2025, 1, 30),
        items: items);
  }
}

class OrderItemModel {
  final int itemId;
  final String productName;
  final double price;
  final int quantity;
  final String sku;

  OrderItemModel(
      {required this.itemId,
      required this.productName,
      required this.price,
      required this.quantity,
      required this.sku});

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
        itemId: json['item_id'],
        productName: json['product_name'],
        price: json['price'],
        quantity: json['quantity'],
        sku: json['sku']);
  }
}
