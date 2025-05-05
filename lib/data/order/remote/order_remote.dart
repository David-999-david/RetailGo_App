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
              'total_price': '3369.97',
              'status': 'Processing',
              'payment_status': 'Unpaid',
              'items': [
                {
                  'variant_id': 'P2001',
                  'quantity': 1,
                  'order_price': '949.99',
                  'sku': 'P2001',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg'
                },
                {
                  'variant_id': 'P2001',
                  'quantity': 1,
                  'order_price': '949.99',
                  'sku': 'P2001',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg'
                },{
                  'variant_id': 'P2001',
                  'quantity': 1,
                  'order_price': '949.99',
                  'sku': 'P2001',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg'
                },{
                  'variant_id': 'P2001',
                  'quantity': 1,
                  'order_price': '949.99',
                  'sku': 'P2001',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg'
                },{
                  'variant_id': 'P2001',
                  'quantity': 1,
                  'order_price': '949.99',
                  'sku': 'P2001',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg'
                },
                {
                  'variant_id': 'P2001',
                  'quantity': 1,
                  'order_price': '949.99',
                  'sku': 'P2001',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg'
                },
                {
                  'variant_id': 'P2002',
                  'quantity': 1,
                  'order_price': '869.99',
                  'sku': 'P2002',
                  'image_url':
                      'https://i.ytimg.com/vi/EA0YC9m6D4s/maxresdefault.jpg'
                },
                {
                  'variant_id': 'P2003',
                  'quantity': 1,
                  'order_price': '2349.99',
                  'sku': 'P2003',
                  'image_url':
                      'https://i.ytimg.com/vi/MTbNTokwDao/maxresdefault.jpg'
                },
              ],
              'created_at': '2025-05-02T12:34:56.000Z',
              'address': '12 Sunset Blvd, Springfield',
              'item_counts': 3,
            },
            {
              'order_id': 3002,
              'user_id': 32,
              'total_price': '1870.98',
              'status': 'Delivered',
              'payment_status': 'Paid',
              'items': [
                {
                  'variant_id': 'K2004',
                  'quantity': 1,
                  'order_price': '474.99',
                  'sku': 'K2004',
                  'image_url':
                      'https://i.pinimg.com/736x/a4/83/b3/a483b39d720b405e684e7c9d1e929f5b.jpg'
                },
                {
                  'variant_id': 'G5001',
                  'quantity': 1,
                  'order_price': '170.00',
                  'sku': 'G5001',
                  'image_url':
                      'https://www.pcworld.com/wp-content/uploads/2024/06/pcw07_GamingSetup_RGBeci.jpg?quality=50&strip=all'
                },
                {
                  'variant_id': 'E7001',
                  'quantity': 1,
                  'order_price': '1224.99',
                  'sku': 'E7001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
              ],
              'created_at': '2025-06-10T10:00:00.000Z',
              'address': '56 Pine Rd, Gotham',
              'item_counts': 3,
            },
            {
              'order_id': 3003,
              'user_id': 33,
              'total_price': '614.98',
              'status': 'Shipped',
              'payment_status': 'Paid',
              'items': [
                {
                  'variant_id': 'E8001',
                  'quantity': 1,
                  'order_price': '94.99',
                  'sku': 'E8001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'T00010',
                  'quantity': 1,
                  'order_price': '179.99',
                  'sku': 'T00010',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'O4001',
                  'quantity': 1,
                  'order_price': '140.00',
                  'sku': 'O4001',
                  'image_url':
                      'https://i5.walmartimages.com/dfw/4ff9c6c9-e398/k2-_8d0ff3c6-d007-4f05-89f8-3e22cf81825b.v1.jpg?odnHeight=680&odnWidth=1208&odnBg=FFFFFF'
                },
              ],
              'created_at': '2025-05-15T09:30:00.000Z',
              'address': '34 Oak Street, Metropolis',
              'item_counts': 3,
            },
            {
              'order_id': 3004,
              'user_id': 34,
              'total_price': '408.99',
              'status': 'Completed',
              'payment_status': 'Paid',
              'items': [
                {
                  'variant_id': 'S5001',
                  'quantity': 1,
                  'order_price': '30.00',
                  'sku': 'S5001',
                  'image_url':
                      'https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto'
                },
                {
                  'variant_id': 'S6001',
                  'quantity': 1,
                  'order_price': '120.00',
                  'sku': 'S6001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'M1001',
                  'quantity': 1,
                  'order_price': '300.00',
                  'sku': 'M1001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
              ],
              'created_at': '2025-04-20T14:20:00.000Z',
              'address': '100 Elm St, Star City',
              'item_counts': 3,
            },
            {
              'order_id': 3005,
              'user_id': 35,
              'total_price': '1096.99',
              'status': 'Cancelled',
              'payment_status': 'Refunded',
              'items': [
                {
                  'variant_id': 'M2001',
                  'quantity': 1,
                  'order_price': '450.00',
                  'sku': 'M2001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'M3001',
                  'quantity': 1,
                  'order_price': '699.99',
                  'sku': 'M3001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'F6002',
                  'quantity': 1,
                  'order_price': '30.00',
                  'sku': 'F6002',
                  'image_url':
                      'https://static.vecteezy.com/system/resources/thumbnails/031/691/377/small/video-game-controller-with-bright-neon-light-streaks-computer-gamer-background-3d-octane-render-game-concept-ideas-ai-generative-free-photo.jpg'
                },
              ],
              'created_at': '2025-06-05T16:45:00.000Z',
              'address': '78 Birch Ave, Central City',
              'item_counts': 3,
            },
            {
              'order_id': 3006,
              'user_id': 36,
              'total_price': '2254.97',
              'status': 'Processing',
              'payment_status': 'Pending',
              'items': [
                {
                  'variant_id': 'P2002',
                  'quantity': 1,
                  'order_price': '869.99',
                  'sku': 'P2002',
                  'image_url':
                      'https://i.ytimg.com/vi/EA0YC9m6D4s/maxresdefault.jpg'
                },
                {
                  'variant_id': 'M1001',
                  'quantity': 1,
                  'order_price': '300.00',
                  'sku': 'M1001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'E9001',
                  'quantity': 1,
                  'order_price': '699.99',
                  'sku': 'E9001',
                  'image_url':
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGxIu3stpJ70l4WajtvWUwNJLwc60yoKYbOidssia7dh_0LXAXcvgoUfMvC_etTtyKXTo&usqp=CAU'
                },
                {
                  'variant_id': 'K2004',
                  'quantity': 1,
                  'order_price': '474.99',
                  'sku': 'K2004',
                  'image_url':
                      'https://i.pinimg.com/736x/a4/83/b3/a483b39d720b405e684e7c9d1e929f5b.jpg'
                },
                {
                  'variant_id': 'G5001',
                  'quantity': 1,
                  'order_price': '170.00',
                  'sku': 'G5001',
                  'image_url':
                      'https://www.pcworld.com/wp-content/uploads/2024/06/pcw07_GamingSetup_RGBeci.jpg?quality=50&strip=all'
                },
              ],
              'created_at': '2025-03-18T08:00:00.000Z',
              'address': '90 Cedar Blvd, Central City',
              'item_counts': 5,
            },
            {
              'order_id': 3007,
              'user_id': 37,
              'total_price': '2808.18',
              'status': 'Shipped',
              'payment_status': 'Paid',
              'items': [
                {
                  'variant_id': 'P2003',
                  'quantity': 1,
                  'order_price': '2349.99',
                  'sku': 'P2003',
                  'image_url':
                      'https://i.ytimg.com/vi/MTbNTokwDao/maxresdefault.jpg'
                },
                {
                  'variant_id': 'E7001',
                  'quantity': 1,
                  'order_price': '1224.99',
                  'sku': 'E7001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'S6001',
                  'quantity': 1,
                  'order_price': '120.00',
                  'sku': 'S6001',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
              ],
              'created_at': '2025-02-10T12:00:00.000Z',
              'address': '23 Maple St, Emerald City',
              'item_counts': 3,
            },
            {
              'order_id': 3008,
              'user_id': 38,
              'total_price': '328.99',
              'status': 'Delivered',
              'payment_status': 'Paid',
              'items': [
                {
                  'variant_id': 'F1005',
                  'quantity': 1,
                  'order_price': '120.00',
                  'sku': 'F1005',
                  'image_url':
                      'https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto'
                },
                {
                  'variant_id': 'T00010',
                  'quantity': 1,
                  'order_price': '179.99',
                  'sku': 'T00010',
                  'image_url':
                      'https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg'
                },
                {
                  'variant_id': 'H01023',
                  'quantity': 1,
                  'order_price': '18.00',
                  'sku': 'H01023',
                  'image_url':
                      'https://originalgranitebracket.com/cdn/shop/articles/Inked0nk1apgq5tf41_LI.jpg?v=1596819937'
                },
                {
                  'variant_id': 'S5001',
                  'quantity': 1,
                  'order_price': '30.00',
                  'sku': 'S5001',
                  'image_url':
                      'https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto'
                },
              ],
              'created_at': '2025-01-05T11:11:00.000Z',
              'address': '15 Oak Lane, Starling City',
              'item_counts': 4,
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
