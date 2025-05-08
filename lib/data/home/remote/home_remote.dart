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
      final List<Map<String, dynamic>> dataList = [
  {
    "product_id": "P2001",
    "name": "iPhone 15",
    "brand": "Apple",
    "category_name": "Electronics",
    "sub_category_name": "Smartphones",
    "base_price": "999.99",
    "discount": "50.00",
    "featured_image": "https://static.vecteezy.com/system/resources/thumbnails/023/124/845/small/gaming-controller-with-fire-cartoon-style-neural-network-generated-art-photo.jpg",
    "attributes": [
      {"attribute_id": 1, "name": "Color",   "value": "Black"},
      {"attribute_id": 2, "name": "Storage", "value": "128GB"}
    ]
  },
  {
    "product_id": "P2002",
    "name": "Samsung Galaxy S24",
    "brand": "Samsung",
    "category_name": "Electronics",
    "sub_category_name": "Smartphones",
    "base_price": "899.99",
    "discount": "30.00",
    "featured_image": "https://i.ytimg.com/vi/EA0YC9m6D4s/maxresdefault.jpg",
    "attributes": [
      {"attribute_id": 3, "name": "Color",   "value": "Phantom Black"},
      {"attribute_id": 4, "name": "Storage", "value": "256GB"}
    ]
  },
  {
    "product_id": "P2003",
    "name": "MacBook Pro 16",
    "brand": "Apple",
    "category_name": "Electronics",
    "sub_category_name": "Laptops",
    "base_price": "2499.99",
    "discount": "150.00",
    "featured_image": "https://i.ytimg.com/vi/MTbNTokwDao/maxresdefault.jpg",
    "attributes": [
      {"attribute_id": 5, "name": "Color", "value": "Space Gray"},
      {"attribute_id": 6, "name": "RAM",   "value": "16GB"}
    ]
  },
  {
    "product_id": "K2004",
    "name": "PlayStation 5",
    "brand": "Sony",
    "category_name": "Electronics",
    "sub_category_name": "Gaming Consoles",
    "base_price": "499.99",
    "discount": "25.00",
    "featured_image": "https://i.pinimg.com/736x/a4/83/b3/a483b39d720b405e684e7c9d1e929f5b.jpg",
    "attributes": [
      {"attribute_id": 7, "name": "Edition", "value": "Digital"},
      {"attribute_id": 8, "name": "Color",   "value": "White"}
    ]
  },
  {
    "product_id": "G5001",
    "name": "Wireless Earbuds",
    "brand": "Sony",
    "category_name": "Electronics",
    "sub_category_name": "Headphones",
    "base_price": "180.00",
    "discount": "10.00",
    "featured_image": "https://www.pcworld.com/wp-content/uploads/2024/06/pcw07_GamingSetup_RGBeci.jpg?quality=50&strip=all",
    "attributes": [
      {"attribute_id": 9,  "name": "Color",        "value": "White"},
      {"attribute_id": 10, "name": "Battery Life", "value": "8h"}
    ]
  },
  {
    "product_id": "E7001",
    "name": "Canon EOS Camera",
    "brand": "Canon",
    "category_name": "Electronics",
    "sub_category_name": "Cameras",
    "base_price": "1299.99",
    "discount": "75.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 11, "name": "Lens",   "value": "24-70mm"},
      {"attribute_id": 12, "name": "Sensor", "value": "Full Frame"}
    ]
  },
  {
    "product_id": "E8001",
    "name": "Logitech MX Keyboard",
    "brand": "Logitech",
    "category_name": "Electronics",
    "sub_category_name": "Keyboards And Mouse",
    "base_price": "99.99",
    "discount": "5.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 13, "name": "Layout",    "value": "QWERTY"},
      {"attribute_id": 14, "name": "Connection", "value": "Wireless"}
    ]
  },
  {
    "product_id": "E9001",
    "name": "Samsung Galaxy Tab",
    "brand": "Samsung",
    "category_name": "Electronics",
    "sub_category_name": "Tablets",
    "base_price": "699.99",
    "discount": "40.00",
    "featured_image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGxIu3stpJ70l4WajtvWUwNJLwc60yoKYbOidssia7dh_0LXAXcvgoUfMvC_etTtyKXTo&usqp=CAU",
    "attributes": [
      {"attribute_id": 15, "name": "Color",   "value": "Silver"},
      {"attribute_id": 16, "name": "Storage", "value": "128GB"}
    ]
  },
  {
    "product_id": "F1005",
    "name": "Men's Running Shoes",
    "brand": "Nike",
    "category_name": "Fashion",
    "sub_category_name": "Shoes",
    "base_price": "120.00",
    "discount": "15.00",
    "featured_image": "https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto",
    "attributes": [
      {"attribute_id": 17, "name": "Size",  "value": "10"},
      {"attribute_id": 18, "name": "Color", "value": "Blue"}
    ]
  },
  {
    "product_id": "T00010",
    "name": "Leather Jacket",
    "brand": "Zara",
    "category_name": "Fashion",
    "sub_category_name": "Clothing",
    "base_price": "199.99",
    "discount": "20.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 19, "name": "Size",     "value": "M"},
      {"attribute_id": 20, "name": "Material", "value": "Leather"}
    ]
  },
  {
    "product_id": "H01023",
    "name": "Organic Honey",
    "brand": "Nature’s Best",
    "category_name": "Food",
    "sub_category_name": "Beverages",
    "base_price": "20.00",
    "discount": "2.00",
    "featured_image": "https://originalgranitebracket.com/cdn/shop/articles/Inked0nk1apgq5tf41_LI.jpg?v=1596819937",
    "attributes": [
      {"attribute_id": 21, "name": "Weight", "value": "500g"},
      {"attribute_id": 22, "name": "Flavor", "value": "Wildflower"}
    ]
  },
  {
    "product_id": "F6002",
    "name": "Protein Bars Pack",
    "brand": "Quest",
    "category_name": "Food",
    "sub_category_name": "Snacks",
    "base_price": "30.00",
    "discount": "3.00",
    "featured_image": "https://static.vecteezy.com/system/resources/thumbnails/031/691/377/small/video-game-controller-with-bright-neon-light-streaks-computer-gamer-background-3d-octane-render-game-concept-ideas-ai-generative-free-photo.jpg",
    "attributes": [
      {"attribute_id": 23, "name": "Flavor", "value": "Chocolate"},
      {"attribute_id": 24, "name": "Count",  "value": "12"}
    ]
  },
  {
    "product_id": "O4001",
    "name": "Camping Tent",
    "brand": "Coleman",
    "category_name": "Sports",
    "sub_category_name": "Cycling",
    "base_price": "150.00",
    "discount": "10.00",
    "featured_image": "https://i5.walmartimages.com/dfw/4ff9c6c9-e398/k2-_8d0ff3c6-d007-4f05-89f8-3e22cf81825b.v1.jpg?odnHeight=680&odnWidth=1208&odnBg=FFFFFF",
    "attributes": [
      {"attribute_id": 25, "name": "Capacity", "value": "4 Person"},
      {"attribute_id": 26, "name": "Color",    "value": "Green"}
    ]
  },
  {
    "product_id": "S5001",
    "name": "Adidas Football",
    "brand": "Adidas",
    "category_name": "Sports",
    "sub_category_name": "Football",
    "base_price": "30.00",
    "discount": "5.00",
    "featured_image": "https://i.rtings.com/assets/pages/x1bSogIa/best-gaming-keyboards-202107-medium.jpg?format=auto",
    "attributes": [
      {"attribute_id": 27, "name": "Size",     "value": "5"},
      {"attribute_id": 28, "name": "Material", "value": "Synthetic"}
    ]
  },
  {
    "product_id": "S6001",
    "name": "Wilson Tennis Racket",
    "brand": "Wilson",
    "category_name": "Sports",
    "sub_category_name": "Tennis",
    "base_price": "120.00",
    "discount": "12.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 29, "name": "Grip Size", "value": "G2"},
      {"attribute_id": 30, "name": "Weight",    "value": "300g"}
    ]
  },
  {
    "product_id": "M1001",
    "name": "Yamaha Acoustic Guitar",
    "brand": "Yamaha",
    "category_name": "Music Instruments",
    "sub_category_name": "Guitars",
    "base_price": "300.00",
    "discount": "25.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 31, "name": "Body", "value": "Dreadnought"},
      {"attribute_id": 32, "name": "Color", "value": "Natural"}
    ]
  },
  {
    "product_id": "M2001",
    "name": "Casio Digital Piano",
    "brand": "Casio",
    "category_name": "Music Instruments",
    "sub_category_name": "Pianos",
    "base_price": "450.00",
    "discount": "30.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 33, "name": "Keys",  "value": "88"},
      {"attribute_id": 34, "name": "Color", "value": "Black"}
    ]
  },
  {
    "product_id": "M3001",
    "name": "Yamaha Drum Set",
    "brand": "Yamaha",
    "category_name": "Music Instruments",
    "sub_category_name": "Drums",
    "base_price": "699.99",
    "discount": "50.00",
    "featured_image": "https://img.freepik.com/premium-photo/gaming-room-with-set-monitors-monitor-that-says-game-room_915071-8163.jpg",
    "attributes": [
      {"attribute_id": 35, "name": "Pieces",         "value": "5"},
      {"attribute_id": 36, "name": "Shell Material", "value": "Maple"}
    ]
  },
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
