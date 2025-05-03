import 'package:flutter/material.dart';
import 'package:retail/common/constants/api_url.dart';
import 'package:retail/core/network/dio_client.dart';
import 'package:retail/data/stripe/model/stripe_model.dart';

class StripeRemote {
  final _dio = DioClient();

Future<StripeModel> getClientSecret(double amount) async {
  try {
    final body = {
      'amount' : (amount * 100).toInt(),
      'currency' : 'usd',
    };
    var response = await _dio.post(ApiUrl.getCleintSecret,data: body);
    if (response.statusCode == 200){
      final clientSecret = StripeModel.fromJson(response.data);
      return clientSecret;
    }
    else {
      throw Exception('Failed to get client secret');
    }
  } catch (e){
    debugPrint('Error in stripe when get clientsecret');
    rethrow;
  }
}
}