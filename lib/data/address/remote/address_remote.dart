import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retail/core/network/dio_client.dart';
import 'package:retail/data/address/model/address_model.dart';

class AddressRemote {
  final _dio = DioClient();

  Future<List<AddressModel>> getAllAddress() async {
    try {
      List<AddressModel> addressList = [];
      final List<Map<String,dynamic>> dataList = [
        {
          'address_id': 1,
          'user_id': 42,
          'address_line': '123 Elm St, Apt 4B',
          'city': 'Springfield',
          'state': 'IL',
          'country': 'USA',
          'postal_code': 62704,
        },
        {
          'address_id': 2,
          'user_id': 42,
          'address_line': '456 Oak Rd',
          'city': 'Shelbyville',
          'state': 'IL',
          'country': 'USA',
          'postal_code': 62565,
        },
        {
          'address_id': 3,
          'user_id': 42,
          'address_line': '789 Pine Blvd',
          'city': 'Capital City',
          'state': 'IL',
          'country': 'USA',
          'postal_code': 62701,
        },
      ];
      for (var data in dataList){
        addressList.add(AddressModel.fromJson(data));
      }
      return addressList;
    }
    on DioException catch (e){
      debugPrint('error when adress : $e');
      return [];
    }
  }
}