import 'package:dio/dio.dart';
import 'package:retail/common/constants/api_url.dart';
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
        {
          "product_id": "P2001",
          "name": "iPhone 15",
          "description": "Latest Apple smartphone with A16 chip",
          "brand": "Apple",
          "discount": "5.00",
          "status": "active",
          "base_price": "999.99",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "featured_image": null
        },
        {
          "product_id": "P2002",
          "name": "Samsung Galaxy S24",
          "description": "Flagship Samsung phone with AMOLED display",
          "brand": "Samsung",
          "discount": "10.00",
          "status": "active",
          "base_price": "899.99",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "featured_image": null
        },
        {
          "product_id": "P2003",
          "name": "MacBook Pro 16",
          "description": "High-end Apple laptop with M3 chip",
          "brand": "Apple",
          "discount": "0.00",
          "status": "active",
          "base_price": "2499.99",
          "category_name": "Electronics",
          "sub_category_name": "Laptops",
          "featured_image": null
        },
        {
          "product_id": "T3001",
          "name": "Testing Product Three",
          "description": "this product is third testing",
          "brand": "Testing Three",
          "discount": "0.00",
          "status": "active",
          "base_price": "890.00",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "featured_image": null
        },
        {
          "product_id": "H01023",
          "name": "Mg Hein",
          "description": "nothing",
          "brand": "Apple",
          "discount": "5.00",
          "status": "active",
          "base_price": "90.90",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "featured_image": null
        },
        {
          "product_id": "M1001",
          "name": "I Phone 17 Pro Max",
          "description": "this product is better than samsung!",
          "brand": "Apple",
          "discount": "0.00",
          "status": "active",
          "base_price": "459.97",
          "category_name": "Electronics",
          "sub_category_name": "Smartphones",
          "featured_image":
              "http://res.cloudinary.com/dilt44xas/image/upload/v1740851656/retailGo/hdip3gfwqe0hr7nhjral.png"
        },
        {
          "product_id": "T00010",
          "name": "T-Shirt R",
          "description": "this product is for adult.",
          "brand": "Google",
          "discount": "0.00",
          "status": "active",
          "base_price": "299.90",
          "category_name": "Fashion",
          "sub_category_name": "Clothing",
          "featured_image":
              "http://res.cloudinary.com/dilt44xas/image/upload/v1741003282/retailGo/rpox4dr5fievwwtg892y.jpg"
        },
        {
          "product_id": "M2002",
          "name": "Macbook Air M1",
          "description": "this product is testing",
          "brand": "Apple",
          "discount": "0.00",
          "status": "active",
          "base_price": "900.00",
          "category_name": "Electronics",
          "sub_category_name": "Laptops",
          "featured_image":
              "http://res.cloudinary.com/dilt44xas/image/upload/v1741092771/retailGo/v4niglzfp3qiaxsaqytw.jpg"
        },
        {
          "product_id": "K2-A1",
          "name": "Keychron K2",
          "description": "nothing",
          "brand": "Keychron",
          "discount": "0.00",
          "status": "active",
          "base_price": "3800.00",
          "category_name": "Electronics",
          "sub_category_name": "Keyboards And Mouse",
          "featured_image":
              "http://res.cloudinary.com/dilt44xas/image/upload/v1741160668/retailGo/ln2uqf4uvnuttmk3e6zt.webp"
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
