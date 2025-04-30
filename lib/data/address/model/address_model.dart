import 'package:flutter/material.dart';

class AddressModel {
  final int addressId;
  final int userId;
  final String addressLine;
  final String city;
  final String state;
  final String country;
  final int postalCode;

  const AddressModel({
    required this.addressId,
    required this.userId,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode
  });

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(
      addressId: json['address_id'] as int, 
      userId: json['user_id'] as int, 
      addressLine: json['address_line'] as String, 
      city: json['city'] as String, 
      state: json['state'] as String, 
      country: json['country'] as String,
      postalCode: json['postal_code'] as int
      );
  }

  Map<String,dynamic> toJson() => {
    'address_id' : addressId,
    'user_id' : userId,
    'address_line' : addressLine,
    'city' : city,
    'state' : state,
    'country' : country,
    'postal_code' : postalCode
  };
}