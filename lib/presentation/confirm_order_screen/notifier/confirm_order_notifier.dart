import 'package:flutter/material.dart';
import 'package:retail/data/address/model/address_model.dart';
import 'package:retail/data/cart/model/cart_model.dart';
import 'package:retail/data/order/model/order_model.dart';
import 'package:retail/domain/address/usecase/address_usecase.dart';
import 'package:retail/domain/cart/usecase/cart_usecase.dart';
import 'package:retail/domain/enums/address_enum.dart';
import 'package:retail/domain/enums/payment_method.dart';
import 'package:retail/domain/order/usecase/order_usecase.dart';

class ConfirmOrderNotifier extends ChangeNotifier {
  List<CartItem> _cartList = [];
  List<CartItem> get cartList => _cartList;
  void getAllcartList() async {
    try {
      _cartList = await CartUsecase().getAllCart();
      notifyListeners();
    } catch (e) {
      debugPrint('Error occur in get cart items : $e');
    }
  }

  double get subTotal => _cartList.fold(0.0, (sum, item) {
        final price = item.price ?? 0.0;
        return sum + (price * item.quantity);
      });
  // double get discountTotal => _cartList.fold(0.0, (sum, item) {
  //       final discountAmount = double.tryParse(item.discount) ?? 0.0;
  //       return sum + (discountAmount * item.qty);
  //     });
  // double get totalPrice => subTotal - discountTotal;

  PaymentMethod _selectedMethod = PaymentMethod.cashOnDelivery;
  PaymentMethod get selectedMethod => _selectedMethod;
  void selectMethod(PaymentMethod method) {
    if (_selectedMethod == method) return;
    _selectedMethod = method;
    notifyListeners();
  }

  AddressEnum _activeOn = AddressEnum.fromSaved;
  AddressEnum get activeOn => _activeOn;
  void onSelect(AddressEnum newChoice) {
    if (_activeOn == newChoice) return;
    _activeOn = newChoice;
    notifyListeners();
  }

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  void getAllAddress() async {
    try {
      _addressList = await AddressUsecase().getAllAddress();
    } catch (e) {
      debugPrint('Error when get All Address : $e');
    }
    notifyListeners();
  }

  AddressModel? _selectedAddress;
  AddressModel? get selectedAddress => _selectedAddress;
  void onSelectAddress(BuildContext context, AddressModel address) {
    _selectedAddress = address;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Delivery Address is choice',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Colors.white,
        ),
        snackBarAnimationStyle: AnimationStyle(duration: Duration(seconds: 1)));
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

  void addNewAddress() {
    AddressModel newAddress = AddressModel(
        addressId: _addressList.length + 1,
        userId: userId,
        addressLine: addressLine.text,
        city: city.text,
        state: state.text,
        country: country.text,
        postalCode: int.tryParse(postalCode.text) ?? 0000);
    _addressList.insert(0, newAddress);
    _activeOn = AddressEnum.fromSaved;
    notifyListeners();
  }

  placeOrder(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => child,
    );
  }

  List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;

  void getAllOrderList() async {
    try {
      _orderList = await GetAllOrdersUseCase().getAllOrders();
    } catch (e) {
      debugPrint('Error : $e');
    }
    notifyListeners();
  }
}
