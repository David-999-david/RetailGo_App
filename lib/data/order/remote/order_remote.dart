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
        'items': [
          {
            'variant_id': 801,
            'quantity': 1,
            'order_price': '60.00',
            'sku': 'KEYBOARD-BASIC',
            'image_url': null
          },
          {
            'variant_id': 802,
            'quantity': 1,
            'order_price': '60.00',
            'sku': 'MOUSE-BASIC',
            'image_url': 'https://example.com/images/mouse-basic.png'
          }
        ],
        'created_at': '2025-05-02T12:34:56.000Z',
        'address': '12 Sunset Blvd, Springfield lkdfdjlkfj dlkfj lkjdf dlkfjlkdjflk dkfjdlkj',
        'item_counts': 2,
      },
      {
        'order_id': 3002,
        'user_id': 32,
        'total_price': '75.50',
        'status': 'Delivered',
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 803,
            'quantity': 1,
            'order_price': '50.00',
            'sku': 'BOOK-ABC',
            'image_url': null
          },
          {
            'variant_id': 804,
            'quantity': 2,
            'order_price': '12.75',
            'sku': 'BOOKMARK',
            'image_url': null
          },
          {
            'variant_id': 805,
            'quantity': 1,
            'order_price': '0.75',
            'sku': 'BOOK-COVER',
            'image_url': 'https://example.com/images/cover.png'
          }
        ],
        'created_at': '2025-04-28T14:00:00.000Z',
        'address': '56 Pine Rd, Gotham',
        'item_counts': 3,
      },
      {
        'order_id': 3003,
        'user_id': 33,
        'total_price': '450.40',
        'status': 'Shipped',
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 806,
            'quantity': 3,
            'order_price': '100.00',
            'sku': 'CHAIR-STD',
            'image_url': 'https://example.com/images/chair-std.png'
          },
          {
            'variant_id': 807,
            'quantity': 1,
            'order_price': '150.40',
            'sku': 'DESK-LITE',
            'image_url': null
          }
        ],
        'created_at': '2025-05-01T09:20:00.000Z',
        'address': '34 Oak Street, Metropolis',
        'item_counts': 2,
      },
      {
        'order_id': 3004,
        'user_id': 34,
        'total_price': '999.99',
        'status': 'Completed',
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 808,
            'quantity': 1,
            'order_price': '499.99',
            'sku': 'LAPTOP-Z',
            'image_url': 'https://example.com/images/laptop-z.png'
          },
          {
            'variant_id': 809,
            'quantity': 2,
            'order_price': '249.99',
            'sku': 'MONITOR-HD',
            'image_url': null
          },
          {
            'variant_id': 810,
            'quantity': 1,
            'order_price': '49.99',
            'sku': 'USB-C-CABLE',
            'image_url': 'https://example.com/images/usb-c-cable.png'
          },
          {
            'variant_id': 811,
            'quantity': 3,
            'order_price': '9.99',
            'sku': 'STICKER-PACK',
            'image_url': null
          }
        ],
        'created_at': '2025-06-15T16:00:00.000Z',
        'address': '100 Elm St, Star City',
        'item_counts': 4,
      },
      {
        'order_id': 3005,
        'user_id': 35,
        'total_price': '35.00',
        'status': 'Cancelled',
        'payment_status': 'Refunded',
        'items': [
          {
            'variant_id': 812,
            'quantity': 2,
            'order_price': '17.50',
            'sku': 'CHARGER-5V',
            'image_url': 'https://example.com/images/charger.png'
          },
          {
            'variant_id': 813,
            'quantity': 1,
            'order_price': '0.00',
            'sku': 'SHIPPING-FEE',
            'image_url': null
          }
        ],
        'created_at': '2025-03-10T08:30:00.000Z',
        'address': '78 Birch Ave, Central City',
        'item_counts': 2,
      },
      {
        'order_id': 3006,
        'user_id': 36,
        'total_price': '215.75',
        'status': 'Processing',
        'payment_status': 'Pending',
        'items': [
          {
            'variant_id': 814,
            'quantity': 1,
            'order_price': '199.99',
            'sku': 'HEADPHONES',
            'image_url': 'https://example.com/images/headphones.png'
          },
          {
            'variant_id': 815,
            'quantity': 2,
            'order_price': '7.89',
            'sku': 'ADAPTER',
            'image_url': null
          },
          {
            'variant_id': 816,
            'quantity': 1,
            'order_price': '0.00',
            'sku': 'GIFT-WRAP',
            'image_url': null
          }
        ],
        'created_at': '2025-04-22T11:45:00.000Z',
        'address': '90 Cedar Blvd, Central City',
        'item_counts': 3,
      },
      {
        'order_id': 3007,
        'user_id': 37,
        'total_price': '580.20',
        'status': 'Shipped',
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 817,
            'quantity': 3,
            'order_price': '59.99',
            'sku': 'WIDGET-A',
            'image_url': null
          },
          {
            'variant_id': 818,
            'quantity': 1,
            'order_price': '360.21',
            'sku': 'WIDGET-B',
            'image_url': 'https://example.com/images/widget-b.png'
          }
        ],
        'created_at': '2025-06-01T10:15:30.000Z',
        'address': '23 Maple St, Emerald City',
        'item_counts': 2,
      },
      {
        'order_id': 3008,
        'user_id': 38,
        'total_price': '49.99',
        'status': 'Delivered',
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 819,
            'quantity': 1,
            'order_price': '19.99',
            'sku': 'MUG-LOGO',
            'image_url': 'https://example.com/images/mug-logo.png'
          },
          {
            'variant_id': 820,
            'quantity': 4,
            'order_price': '5.00',
            'sku': 'COASTER',
            'image_url': null
          },
          {
            'variant_id': 821,
            'quantity': 1,
            'order_price': '9.00',
            'sku': 'PEN-PRO',
            'image_url': null
          }
        ],
        'created_at': '2025-05-30T14:20:00.000Z',
        'address': '15 Oak Lane, Starling City',
        'item_counts': 3,
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
