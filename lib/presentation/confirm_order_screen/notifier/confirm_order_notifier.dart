import 'package:flutter/material.dart';
import 'package:retail/data/address/model/address_model.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/domain/address/usecase/address_usecase.dart';
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

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  void getAllAddress() async {
    try {
      _addressList = await AddressUsecase().getAllAddress();
    } catch (e){
      debugPrint('Error when get All Address : $e');
    }
    notifyListeners();
  }

  AddressModel? _selectedAddress;
  AddressModel? get  selectedddress => _selectedAddress;
  void onSelectAddress(AddressModel address){
    _selectedAddress = address;
    debugPrint('$address');
    notifyListeners();
  }

  final int userId = 9239;
  TextEditingController addressLine = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postalCode = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    addressLine.dispose();
    city.dispose();
    state.dispose();
    country.dispose();
    postalCode.dispose();
  }

  void addNewAddress(){
    AddressModel newAddress = AddressModel(
      addressId: _addressList.length +1, 
      userId: userId!, 
      addressLine: addressLine.text, 
      city: city.text, 
      state: state.text, 
      country: country.text, 
      postalCode: int.tryParse(postalCode.text) ?? 0000);
    _addressList.insert(0, newAddress);
    _activeOn = AddressEnum.fromSaved;
    notifyListeners();
  }

  
}