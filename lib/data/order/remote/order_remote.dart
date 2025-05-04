import 'package:dio/dio.dart';
import 'package:retail/core/network/dio_client.dart';
import 'package:retail/data/order/model/order_model.dart';

class OrderRemote {
  final _dio = DioClient();

  Future<List<OrderModel>> getAllOrder() async {
    try {
      List<OrderModel> ordersList = [];

      final List<Map<String, dynamic>> orderData = [
  {
    "orders": [
      {
        'order_id': 3001,
        'user_id': 31,
        'total_price': '120.00',
        'status': 'Processing',
        'payment_status': 'Unpaid',
        'items': [],
        'created_at': '2025-05-02T12:34:56.000Z',  // May 2
        'address': '12 Sunset Blvd, Springfield',
        'item_counts': 2,
      },
      {
        'order_id': 3002,
        'user_id': 32,
        'total_price': '75.50',
        'status': 'Delivered',
        'payment_status': 'Paid',
        'items': [],
        'created_at': '2025-04-28T14:00:00.000Z',  // Apr 28
        'address': '56 Pine Rd, Gotham',
        'item_counts': 1,
      },
      {
        'order_id': 3003,
        'user_id': 33,
        'total_price': '450.40',
        'status': 'Shipped',
        'payment_status': 'Paid',
        'items': [],
        'created_at': '2025-05-01T09:20:00.000Z',  // May 1
        'address': '34 Oak Street, Metropolis',
        'item_counts': 3,
      },
      {
        'order_id': 3004,
        'user_id': 34,
        'total_price': '999.99',
        'status': 'Completed',
        'payment_status': 'Paid',
        'items': [],
        'created_at': '2025-06-15T16:00:00.000Z',  // Jun 15
        'address': '100 Elm St, Star City',
        'item_counts': 5,
      },
      {
        'order_id': 3005,
        'user_id': 35,
        'total_price': '35.00',
        'status': 'Cancelled',
        'payment_status': 'Refunded',
        'items': [],
        'created_at': '2025-03-10T08:30:00.000Z',  // Mar 10
        'address': '78 Birch Ave, Central City',
        'item_counts': 2,
      },
      {
        'order_id': 3006,
        'user_id': 36,
        'total_price': '215.75',
        'status': 'Processing',
        'payment_status': 'Pending',
        'items': [],
        'created_at': '2025-04-22T11:45:00.000Z',  // Apr 22
        'address': '90 Cedar Blvd, Central City',
        'item_counts': 4,
      },
      {
        'order_id': 3007,
        'user_id': 37,
        'total_price': '580.20',
        'status': 'Shipped',
        'payment_status': 'Paid',
        'items': [],
        'created_at': '2025-06-01T10:15:30.000Z',  // Jun 1
        'address': '23 Maple St, Emerald City',
        'item_counts': 3,
      },
      {
        'order_id': 3008,
        'user_id': 38,
        'total_price': '49.99',
        'status': 'Delivered',
        'payment_status': 'Paid',
        'items': [],
        'created_at': '2025-05-30T14:20:00.000Z',  // May 30
        'address': '15 Oak Lane, Starling City',
        'item_counts': 1,
      },
    ],
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
