

import 'package:flutter/material.dart';

class RegisterNotifier extends ChangeNotifier {
  final TextEditingController _fullNameCtr = TextEditingController();
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();
  final TextEditingController _phoneCtr = TextEditingController();
  final TextEditingController _addressCtr = TextEditingController();

  TextEditingController get fullNameCtr => _fullNameCtr;
  TextEditingController get emailCtr => _emailCtr;
  TextEditingController get passwordCtr => _passwordCtr;
  TextEditingController get phoneCtr => _phoneCtr;
  TextEditingController get addressCtr => _addressCtr;

  bool _isVisibility = true;
  bool get isVisibility => _isVisibility;

  void changeVisibility() {
    _isVisibility = !_isVisibility;
    notifyListeners();
  }
   
}