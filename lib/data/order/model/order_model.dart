import 'package:retail/domain/enums/payment_method.dart';

class OrderModel {
  final int orderId;
  final String status;
  final String paymentStatus;
  final PaymentMethod paymentMethod;
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
    
    final rawMethod = json['payment_method'] as String ?? '';

    final method = PaymentMethod.values.firstWhere(
      (e) => e.name == rawMethod,
      orElse: () {
        return PaymentMethod.cashOnDelivery;
      },
    );

    return OrderModel(
        orderId: json['order_id'] ?? 0,
        status: json['status'] ?? 'Unknown',
        paymentStatus: json['payment_status'] ?? 'Unknown',
        paymentMethod: method,
        itemsCount: items.fold(0, (sum, item) => sum + item.quantity),
        totalPrice: (json['total_price'] ?? 0.0).toDouble(),
        createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
            DateTime(2025, 1, 30),
        items: items);
  }

  Map<String, dynamic> toJson(){
    return {
      'order_id' : orderId,
      'status' : status,
      'payment_status' : paymentStatus,
      'payment_method' : paymentMethod.name,
      'items_count' : itemsCount,
      'total_price' : totalPrice,
      'created_at' : createdAt.toIso8601String(),
      'order_items' : items.map((i) => i.toJson()).toList(),
    };
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

  Map<String, dynamic> toJson(){
    return {
      'item_id' : itemId,
      'product_name' : productName,
      'price' : price,
      'quantity' : quantity,
      'sku' : sku
    };
  }
}
