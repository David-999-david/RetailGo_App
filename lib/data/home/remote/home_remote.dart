import 'package:dio/dio.dart';
import 'package:retail/core/network/dio_client.dart';
import 'package:retail/data/home/model/product_model.dart';

class HomeRemote {
  final _dio = DioClient();
  Future<List<ProductModel>> getAllProducts() async {
    try {
      // var response = await _dio.get(ApiUrl.getAllProducts);
      // List<ProductModel> productList = [];
      // if (response.statusCode == 200) {
      //   var res = response.data;
      //   if (res['success'] == true) {
      //     for (var data in res['data']) {
      //       productList.add(ProductModel.fromJson(data));
      //     }
      //   }
      // }
      List<ProductModel> productList = [];
      List dataList = [
        // 📌 Electronics Category
        {
          "product_id": "P2001",
          "name": "iPhone 15",
          "brand": "Apple",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "base_price": "999.99",
          "featured_image":
              "https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg"
        },
        {
          "product_id": "P2002",
          "name": "Samsung Galaxy S24",
          "brand": "Samsung",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "base_price": "899.99",
          "featured_image":
              "https://i.ytimg.com/vi/EA0YC9m6D4s/maxresdefault.jpg"
        },
        {
          "product_id": "P2003",
          "name": "MacBook Pro 16",
          "brand": "Apple",
          "category_name": "Electronics",
          "sub_category_name": "Laptops",
          "base_price": "2499.99",
          "featured_image":
              "https://i.ytimg.com/vi/MTbNTokwDao/maxresdefault.jpg"
        },
        {
          "product_id": "K2004",
          "name": "PlayStation 5",
          "brand": "Sony",
          "category_name": "Electronics",
          "sub_category_name": "Gaming Consoles",
          "base_price": "499.99",
          "featured_image":
              "https://i.pinimg.com/736x/a4/83/b3/a483b39d720b405e684e7c9d1e929f5b.jpg"
        },
        {
          "product_id": "G5001",
          "name": "Wireless Earbuds",
          "brand": "Sony",
          "category_name": "Electronics",
          "sub_category_name": "Headphones",
          "base_price": "180.00",
          "featured_image":
              "https://www.pcworld.com/wp-content/uploads/2024/06/pcw07_GamingSetup_RGBeci.jpg?quality=50&strip=all"
        },
        {
          "product_id": "E7001",
          "name": "Canon EOS Camera",
          "brand": "Canon",
          "category_name": "Electronics",
          "sub_category_name": "Cameras",
          "base_price": "1299.99",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        },
        {
          "product_id": "E8001",
          "name": "Logitech MX Keyboard",
          "brand": "Logitech",
          "category_name": "Electronics",
          "sub_category_name": "Keyboards And Mouse",
          "base_price": "99.99",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        },
        {
          "product_id": "E9001",
          "name": "Samsung Galaxy Tab",
          "brand": "Samsung",
          "category_name": "Electronics",
          "sub_category_name": "Tablets",
          "base_price": "699.99",
          "featured_image":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGxIu3stpJ70l4WajtvWUwNJLwc60yoKYbOidssia7dh_0LXAXcvgoUfMvC_etTtyKXTo&usqp=CAU"
        },

        // 📌 Fashion Category
        {
          "product_id": "F1005",
          "name": "Men's Running Shoes",
          "brand": "Nike",
          "category_name": "Fashion",
          "sub_category_name": "Shoes",
          "base_price": "120.00",
          "featured_image":
              "https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto"
        },
        {
          "product_id": "T00010",
          "name": "Leather Jacket",
          "brand": "Zara",
          "category_name": "Fashion",
          "sub_category_name": "Clothing",
          "base_price": "199.99",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        },

        // 📌 Food Category
        {
          "product_id": "H01023",
          "name": "Organic Honey",
          "brand": "Nature’s Best",
          "category_name": "Food",
          "sub_category_name": "Beverages",
          "base_price": "20.00",
          "featured_image":
              "https://originalgranitebracket.com/cdn/shop/articles/Inked0nk1apgq5tf41_LI.jpg?v=1596819937"
        },
        {
          "product_id": "F6002",
          "name": "Protein Bars Pack",
          "brand": "Quest",
          "category_name": "Food",
          "sub_category_name": "Snacks",
          "base_price": "30.00",
          "featured_image":
              "https://static.vecteezy.com/system/resources/thumbnails/031/691/377/small/video-game-controller-with-bright-neon-light-streaks-computer-gamer-background-3d-octane-render-game-concept-ideas-ai-generative-free-photo.jpg"
        },

        // 📌 Sports Category
        {
          "product_id": "O4001",
          "name": "Camping Tent",
          "brand": "Coleman",
          "category_name": "Sports",
          "sub_category_name": "Cycling",
          "base_price": "150.00",
          "featured_image":
              "https://i5.walmartimages.com/dfw/4ff9c6c9-e398/k2-_8d0ff3c6-d007-4f05-89f8-3e22cf81825b.v1.jpg?odnHeight=680&odnWidth=1208&odnBg=FFFFFF"
        },
        {
          "product_id": "S5001",
          "name": "Adidas Football",
          "brand": "Adidas",
          "category_name": "Sports",
          "sub_category_name": "Football",
          "base_price": "30.00",
          "featured_image":
              "https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto"
        },
        {
          "product_id": "S6001",
          "name": "Wilson Tennis Racket",
          "brand": "Wilson",
          "category_name": "Sports",
          "sub_category_name": "Tennis",
          "base_price": "120.00",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        },

        // 📌 Music Instruments Category
        {
          "product_id": "M1001",
          "name": "Yamaha Acoustic Guitar",
          "brand": "Yamaha",
          "category_name": "Music Instruments",
          "sub_category_name": "Guitars",
          "base_price": "300.00",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        },
        {
          "product_id": "M2001",
          "name": "Casio Digital Piano",
          "brand": "Casio",
          "category_name": "Music Instruments",
          "sub_category_name": "Pianos",
          "base_price": "450.00",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        },
        {
          "product_id": "M3001",
          "name": "Yamaha Drum Set",
          "brand": "Yamaha",
          "category_name": "Music Instruments",
          "sub_category_name": "Drums",
          "base_price": "699.99",
          "featured_image":
              "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg"
        }
      ];

      for (var data in dataList) {
        productList.add(ProductModel.fromJson(data));
      }
      return productList;
    } on DioException catch (e) {
      throw e.response!.data['message'];
    }
  }
}
