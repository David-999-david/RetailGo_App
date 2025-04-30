import 'package:flutter/material.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/domain/cart/usecase/cart_usecase.dart';
import 'package:retail/domain/enums/address_enum.dart';
import 'package:retail/domain/enums/payment_method.dart';

class ConfirmOrderNotifier extends ChangeNotifier{

  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;
  void getAllcartList() async {
    try {
      _cartList = await CartUsecase().getAllCart();
      notifyListeners();
    }
    catch (e){
      debugPrint('Error occur in get cart items : $e');
    }
  }

  double get subTotal => _cartList.fold(0.0, (sum , item){
    final price = double.tryParse(item.basePrice) ?? 0.0;
    return sum + (price * item.qty);
  });
  double get discountTotal => _cartList.fold(0.0, (sum , item){
    final discountAmount = double.tryParse(item.discount) ?? 0.0;
    return sum + (discountAmount * item.qty);
  });
  double get totalPrice => subTotal - discountTotal;


  PaymentMethod _selectedMethod = PaymentMethod.cashOnDelivery;
  PaymentMethod get selectedMethod => _selectedMethod;
  void selectMethod(PaymentMethod method){
    if (_selectedMethod == method) return;
    _selectedMethod = method;
    notifyListeners();
  }

  AddressEnum _activeOn = AddressEnum.fromSaved;
  AddressEnum get activeOn => _activeOn;
  void onSelect(AddressEnum newChoice){
    if (_activeOn == newChoice) return;
    _activeOn = newChoice;
    notifyListeners();
  }

  


  
}