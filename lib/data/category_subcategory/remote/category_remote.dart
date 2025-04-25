import 'package:dio/dio.dart';

import 'package:retail/core/network/dio_client.dart';
import 'package:retail/data/category_subcategory/model/category_model.dart';

class CategoryRemote {
  final _dio = DioClient();

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      List<CategoryModel> categoryList = [];
      List categoryData = [
        {
          "error": false,
          "success": true,
          "data": [
            {
              "category_id": 1,
              "category_name": "Electronics",
              "created_at": "2025-02-26T12:09:19.573Z",
              "updated_at": "2025-02-26T12:09:19.573Z",
              "sub_categories": [
                {"sub_category_id": 1, "sub_category_name": "Smartphones"},
                {"sub_category_id": 2, "sub_category_name": "Laptops"},
                {"sub_category_id": 3, "sub_category_name": "Headphones"},
                {"sub_category_id": 4, "sub_category_name": "Tablets"},
                {"sub_category_id": 5, "sub_category_name": "Gaming Consoles"},
                {"sub_category_id": 6, "sub_category_name": "Cameras"},
                {
                  "sub_category_id": 7,
                  "sub_category_name": "Keyboards And Mouse"
                },
                {"sub_category_id": 8, "sub_category_name": "Smartwatches"},
                {"sub_category_id": 9, "sub_category_name": "Power Adapter"},
                {"sub_category_id": 10, "sub_category_name": "VR Headsets"}
              ]
            },
            {
              "category_id": 2,
              "category_name": "Fashion",
              "sub_categories": [
                {"sub_category_id": 11, "sub_category_name": "Clothing"},
                {"sub_category_id": 12, "sub_category_name": "Shoes"},
                {"sub_category_id": 13, "sub_category_name": "Bags"},
                {"sub_category_id": 14, "sub_category_name": "Sunglasses"},
                {"sub_category_id": 15, "sub_category_name": "Jewelry"},
                {"sub_category_id": 16, "sub_category_name": "Watches"},
                {"sub_category_id": 17, "sub_category_name": "Hats"},
                {"sub_category_id": 18, "sub_category_name": "Scarves"}
              ]
            },
            {
              "category_id": 3,
              "category_name": "Home Appliances",
              "sub_categories": [
                {"sub_category_id": 19, "sub_category_name": "Refrigerators"},
                {"sub_category_id": 20, "sub_category_name": "Microwaves"},
                {"sub_category_id": 21, "sub_category_name": "Ovens"},
                {"sub_category_id": 22, "sub_category_name": "Vacuum Cleaners"},
                {
                  "sub_category_id": 23,
                  "sub_category_name": "Washing Machines"
                },
                {"sub_category_id": 24, "sub_category_name": "Dishwashers"},
                {"sub_category_id": 25, "sub_category_name": "Coffee Makers"}
              ]
            },
            {
              "category_id": 4,
              "category_name": "Food",
              "sub_categories": [
                {"sub_category_id": 26, "sub_category_name": "Vegetables"},
                {"sub_category_id": 27, "sub_category_name": "Fruits"},
                {"sub_category_id": 28, "sub_category_name": "Dairy Products"},
                {"sub_category_id": 29, "sub_category_name": "Meat"},
                {"sub_category_id": 30, "sub_category_name": "Snacks"},
                {"sub_category_id": 31, "sub_category_name": "Beverages"},
                {"sub_category_id": 32, "sub_category_name": "Frozen Foods"}
              ]
            },
            {
              "category_id": 5,
              "category_name": "Vehicles",
              "sub_categories": [
                {"sub_category_id": 33, "sub_category_name": "Cars"},
                {"sub_category_id": 34, "sub_category_name": "Bikes"},
                {"sub_category_id": 35, "sub_category_name": "Trucks"},
                {
                  "sub_category_id": 36,
                  "sub_category_name": "Electric Scooters"
                },
                {"sub_category_id": 37, "sub_category_name": "Buses"},
                {"sub_category_id": 38, "sub_category_name": "Boats"},
                {"sub_category_id": 39, "sub_category_name": "Racing Bikes"}
              ]
            },
            {
              "category_id": 6,
              "category_name": "Books",
              "sub_categories": [
                {"sub_category_id": 40, "sub_category_name": "Fiction"},
                {"sub_category_id": 41, "sub_category_name": "Non-Fiction"},
                {"sub_category_id": 42, "sub_category_name": "Comics"},
                {"sub_category_id": 43, "sub_category_name": "Science Fiction"},
                {"sub_category_id": 44, "sub_category_name": "Biographies"},
                {"sub_category_id": 45, "sub_category_name": "Self-Help"}
              ]
            },
            {
              "category_id": 7,
              "category_name": "Toys",
              "sub_categories": [
                {"sub_category_id": 46, "sub_category_name": "Action Figures"},
                {"sub_category_id": 47, "sub_category_name": "Dolls"},
                {"sub_category_id": 48, "sub_category_name": "Puzzles"},
                {"sub_category_id": 49, "sub_category_name": "Board Games"},
                {
                  "sub_category_id": 50,
                  "sub_category_name": "Educational Toys"
                },
                {"sub_category_id": 51, "sub_category_name": "Soft Toys"}
              ]
            },
            {
              "category_id": 8,
              "category_name": "Sports",
              "sub_categories": [
                {"sub_category_id": 52, "sub_category_name": "Football"},
                {"sub_category_id": 53, "sub_category_name": "Basketball"},
                {"sub_category_id": 54, "sub_category_name": "Tennis"},
                {"sub_category_id": 55, "sub_category_name": "Cricket"},
                {"sub_category_id": 56, "sub_category_name": "Swimming Gear"},
                {"sub_category_id": 57, "sub_category_name": "Cycling"}
              ]
            },
            {
              "category_id": 9,
              "category_name": "Music Instruments",
              "sub_categories": [
                {"sub_category_id": 58, "sub_category_name": "Guitars"},
                {"sub_category_id": 59, "sub_category_name": "Pianos"},
                {"sub_category_id": 60, "sub_category_name": "Drums"},
                {"sub_category_id": 61, "sub_category_name": "Violins"},
                {"sub_category_id": 62, "sub_category_name": "Flutes"}
              ]
            },
            {
              "category_id": 10,
              "category_name": "Pet Supplies",
              "sub_categories": [
                {"sub_category_id": 63, "sub_category_name": "Dog Food"},
                {"sub_category_id": 64, "sub_category_name": "Cat Food"},
                {"sub_category_id": 65, "sub_category_name": "Bird Supplies"},
                {"sub_category_id": 66, "sub_category_name": "Aquarium"},
                {"sub_category_id": 67, "sub_category_name": "Pet Toys"}
              ]
            }
          ]
        }
      ];

      for (var data in categoryData[0]['data']) {
        categoryList.add(CategoryModel.fromJson(data));
      }
      return categoryList;
    } on DioException catch (e) {
      throw e.response!.data['message'];
    }
  }
}
