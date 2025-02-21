import 'package:flutter/material.dart';

class SignInNotifier extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _pswCtr = TextEditingController();
  get formkey => _formKey;
  TextEditingController get emailCtr => _emailCtr;
  TextEditingController get pswCtr => _pswCtr;
  bool _isVisibility = true;
  bool get isVisibility => _isVisibility;

  void changeVisibility() {
    _isVisibility = !_isVisibility;
    notifyListeners();
  }
}
