import 'package:dio/dio.dart';
import 'package:retail/core/network/dio_client.dart';
import 'package:retail/data/order/model/order_model.dart';

class OrderRemote {
  final _dio = DioClient();

  Future<List<OrderModel>> getAllOrder() async {
    try {
      List<OrderModel> ordersList = [];

      List orderData = [
        {
          "status": "success",
          "orders": [
            {
              "order_id": 12351,
              "total_price": 250.00,
              "status": "Completed",
              "payment_status": "Paid",
              "payment_method": "Credit Card", // Added payment method
              "created_at": "2024-03-15",
              "items_count": 5,
              "order_items": [
                {
                  "item_id": 12,
                  "product_name": "Gaming Laptop",
                  "quantity": 1,
                  "price": 200.00,
                  "sku": "GL-RED-128GB"
                },
                {
                  "item_id": 13,
                  "product_name": "Cooling Pad",
                  "quantity": 1,
                  "price": 30.00,
                  "sku": "CP-BLUE"
                },
                {
                  "item_id": 14,
                  "product_name": "Gaming Mouse",
                  "quantity": 1,
                  "price": 20.00,
                  "sku": "GM-BLACK"
                },
                {
                  "item_id": 16,
                  "product_name": "Cooling Pad",
                  "quantity": 1,
                  "price": 30.00,
                  "sku": "CP-BLUE"
                },
                {
                  "item_id": 15,
                  "product_name": "Cooling Pad",
                  "quantity": 1,
                  "price": 60.00,
                  "sku": "CP-GREY"
                }
              ]
            },
            {
              "order_id": 12350,
              "total_price": 200.75,
              "status": "Processing",
              "payment_status": "Paid",
              "payment_method": "PayPal",
              "created_at": "2024-03-14",
              "items_count": 4,
              "order_items": [
                {
                  "item_id": 1,
                  "product_name": "Laptop",
                  "quantity": 1,
                  "price": 120.50,
                  "sku": "LP-SILVER-256GB"
                },
                {
                  "item_id": 2,
                  "product_name": "Mouse",
                  "quantity": 2,
                  "price": 15.00,
                  "sku": "MS-WHITE"
                },
                {
                  "item_id": 3,
                  "product_name": "Keyboard",
                  "quantity": 1,
                  "price": 50.25,
                  "sku": "KB-BLACK-MECH"
                }
              ]
            },
            {
              "order_id": 12349,
              "total_price": 150.00,
              "status": "Pending",
              "payment_status": "Unpaid",
              "payment_method": "Bank Transfer",
              "created_at": "2024-03-13",
              "items_count": 3,
              "order_items": [
                {
                  "item_id": 4,
                  "product_name": "Smartphone",
                  "quantity": 1,
                  "price": 150.00,
                  "sku": "SP-BLACK-256GB"
                }
              ]
            },
            {
              "order_id": 12348,
              "total_price": 99.99,
              "status": "Delivered",
              "payment_status": "Paid",
              "payment_method": "Credit Card",
              "created_at": "2024-03-12",
              "items_count": 2,
              "order_items": [
                {
                  "item_id": 5,
                  "product_name": "Tablet",
                  "quantity": 1,
                  "price": 99.99,
                  "sku": "TB-GOLD-64GB"
                }
              ]
            },
            {
              "order_id": 12347,
              "total_price": 45.50,
              "status": "Shipped",
              "payment_status": "Paid",
              "payment_method": "Debit Card",
              "created_at": "2024-03-11",
              "items_count": 1,
              "order_items": [
                {
                  "item_id": 6,
                  "product_name": "Headphones",
                  "quantity": 1,
                  "price": 45.50,
                  "sku": "HP-RED-WIRELESS"
                }
              ]
            },
            {
              "order_id": 12346,
              "total_price": 180.25,
              "status": "Processing",
              "payment_status": "Unpaid",
              "payment_method": "Bank Transfer",
              "created_at": "2024-03-10",
              "items_count": 5,
              "order_items": [
                {
                  "item_id": 7,
                  "product_name": "Monitor",
                  "quantity": 1,
                  "price": 180.25,
                  "sku": "MN-BLACK-24IN"
                }
              ]
            },
            {
              "order_id": 12345,
              "total_price": 120.00,
              "status": "Completed",
              "payment_status": "Paid",
              "payment_method": "PayPal",
              "created_at": "2024-03-09",
              "items_count": 3,
              "order_items": [
                {
                  "item_id": 8,
                  "product_name": "Wireless Mouse",
                  "quantity": 1,
                  "price": 30.00,
                  "sku": "WM-GREEN"
                },
                {
                  "item_id": 9,
                  "product_name": "Wireless Keyboard",
                  "quantity": 1,
                  "price": 90.00,
                  "sku": "WK-BLUE"
                }
              ]
            },
            {
              "order_id": 12344,
              "total_price": 80.00,
              "status": "Pending",
              "payment_status": "Unpaid",
              "payment_method": "Cash on Delivery",
              "created_at": "2024-03-08",
              "items_count": 2,
              "order_items": [
                {
                  "item_id": 10,
                  "product_name": "Gaming Controller",
                  "quantity": 1,
                  "price": 80.00,
                  "sku": "GC-BLACK-WIRELESS"
                }
              ]
            },
            {
              "order_id": 12343,
              "total_price": 50.00,
              "status": "Canceled",
              "payment_status": "Refunded",
              "payment_method": "Credit Card",
              "created_at": "2024-03-07",
              "items_count": 1,
              "order_items": [
                {
                  "item_id": 11,
                  "product_name": "USB-C Cable",
                  "quantity": 2,
                  "price": 25.00,
                  "sku": "UC-WHITE-1M"
                }
              ]
            }
          ]
        }
      ];

      ;
      for (var data in orderData[0]['orders']) {
        ordersList.add(OrderModel.fromJson(data));
      }
      return ordersList;
    } on DioException catch (e) {
      throw e.response!.data['message'];
    }
  }
}
