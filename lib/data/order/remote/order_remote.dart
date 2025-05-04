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
        'order_id': 2001,
        'user_id': 21,
        'total_price': '320.75',
        'status': 'Delivered',          // ← added
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 701,
            'quantity': 1,
            'order_price': '199.99',
            'sku': 'PROBOOK-15-8GB',
            'image_url': 'https://example.com/images/probook.png'
          },
          {
            'variant_id': 702,
            'quantity': 2,
            'order_price': '49.88',
            'sku': 'USB-C-HUB-4PORT',
            'image_url': null
          },
          {
            'variant_id': 703,
            'quantity': 1,
            'order_price': '20.88',
            'sku': 'LOGO-STICKER',
            'image_url': null
          },
          {
            'variant_id': 704,
            'quantity': 1,
            'order_price': '50.00',
            'sku': 'MOUSE-PRO',
            'image_url': 'https://example.com/images/mousepro.png'
          },
        ],
        'created_at': '2025-05-02T12:34:56.000Z',
        'address': '12 Sunset Blvd, Springfield',
        'item_counts': 4,
      },
      {
        'order_id': 2002,
        'user_id': 22,
        'total_price': '450.40',
        'status': 'Processing',         // ← added
        'payment_status': 'Pending',
        'items': [
          {
            'variant_id': 705,
            'quantity': 1,
            'order_price': '299.99',
            'sku': 'TABLET-X10-64GB',
            'image_url': 'https://example.com/images/tabletx10.png'
          },
          {
            'variant_id': 706,
            'quantity': 3,
            'order_price': '50.13',
            'sku': 'PEN-STYLUS',
            'image_url': null
          },
          {
            'variant_id': 707,
            'quantity': 2,
            'order_price': '25.14',
            'sku': 'SCREEN-COVER',
            'image_url': 'https://example.com/images/cover.png'
          },
          {
            'variant_id': 708,
            'quantity': 1,
            'order_price': '24.14',
            'sku': 'EARPHONES',
            'image_url': null
          },
        ],
        'created_at': '2025-05-01T09:20:00.000Z',
        'address': '34 Oak Street, Metropolis',
        'item_counts': 4,
      },
      {
        'order_id': 2003,
        'user_id': 23,
        'total_price': '125.00',
        'status': 'Cancelled',          // ← added
        'payment_status': 'Refunded',
        'items': [
          {
            'variant_id': 709,
            'quantity': 5,
            'order_price': '25.00',
            'sku': 'CABLE-USB-A',
            'image_url': null
          },
          {
            'variant_id': 710,
            'quantity': 2,
            'order_price': '12.50',
            'sku': 'ADAPTER-HDMI',
            'image_url': 'https://example.com/images/hdmi.png'
          },
          {
            'variant_id': 711,
            'quantity': 1,
            'order_price': '75.00',
            'sku': 'POWER-BANK-10000',
            'image_url': 'https://example.com/images/pbank.png'
          },
        ],
        'created_at': '2025-04-28T14:00:00.000Z',
        'address': '56 Pine Rd, Gotham',
        'item_counts': 3,
      },
      {
        'order_id': 2004,
        'user_id': 24,
        'total_price': '799.99',
        'status': 'Shipped',            // ← added
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 712,
            'quantity': 1,
            'order_price': '499.99',
            'sku': 'SMARTPHONE-X',
            'image_url': 'https://example.com/images/smartphonex.png'
          },
          {
            'variant_id': 713,
            'quantity': 1,
            'order_price': '300.00',
            'sku': 'WIRELESS-CHARGER',
            'image_url': null
          },
          {
            'variant_id': 714,
            'quantity': 2,
            'order_price': '50.00',
            'sku': 'PHONE-COVER',
            'image_url': 'https://example.com/images/cover2.png'
          },
          {
            'variant_id': 715,
            'quantity': 1,
            'order_price': '100.00',
            'sku': 'BLUETOOTH-HEADSET',
            'image_url': 'https://example.com/images/headset.png'
          },
          {
            'variant_id': 716,
            'quantity': 3,
            'order_price': '20.00',
            'sku': 'SCREEN-GUARD',
            'image_url': null
          },
        ],
        'created_at': '2025-04-26T18:15:30.000Z',
        'address': '78 Elm Ave, Star City',
        'item_counts': 5,
      },
      {
        'order_id': 2005,
        'user_id': 25,
        'total_price': '60.00',
        'status': 'Processing',         // ← added
        'payment_status': 'Unpaid',
        'items': [
          {
            'variant_id': 717,
            'quantity': 2,
            'order_price': '30.00',
            'sku': 'TP-LINK-ROUTER',
            'image_url': 'https://example.com/images/router.png'
          },
          {
            'variant_id': 718,
            'quantity': 1,
            'order_price': '0.00',
            'sku': 'SETUP-FEE',
            'image_url': null
          },
          {
            'variant_id': 719,
            'quantity': 3,
            'order_price': '10.00',
            'sku': 'ETHERNET-CABLE',
            'image_url': null
          },
          {
            'variant_id': 720,
            'quantity': 1,
            'order_price': '20.00',
            'sku': 'WALL-MOUNT',
            'image_url': 'https://example.com/images/mount.png'
          },
        ],
        'created_at': '2025-04-24T11:05:00.000Z',
        'address': '90 Cedar Blvd, Central City',
        'item_counts': 4,
      },
      {
        'order_id': 2006,
        'user_id': 26,
        'total_price': '360.49',
        'status': 'Completed',          // ← added
        'payment_status': 'Paid',
        'items': [
          {
            'variant_id': 721,
            'quantity': 1,
            'order_price': '120.00',
            'sku': 'MECHANICAL-KEYBOARD',
            'image_url': null
          },
          {
            'variant_id': 722,
            'quantity': 1,
            'order_price': '80.49',
            'sku': 'GAMING-MOUSE-PRO',
            'image_url': 'https://example.com/images/gmousepro.png'
          },
          {
            'variant_id': 723,
            'quantity': 2,
            'order_price': '80.00',
            'sku': 'HEADSET-PAD',
            'image_url': null
          },
          {
            'variant_id': 724,
            'quantity': 1,
            'order_price': '80.00',
            'sku': 'MIC-USB',
            'image_url': 'https://example.com/images/mic.png'
          },
          {
            'variant_id': 725,
            'quantity': 1,
            'order_price': '0.00',
            'sku': 'WARRANTY-EXT',
            'image_url': null
          },
        ],
        'created_at': '2025-04-22T16:45:10.000Z',
        'address': '12 Maple St, Emerald City',
        'item_counts': 5,
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
