import 'package:flutter/material.dart';
import 'package:retail/presentation/onboard/service/onboard_service.dart';

class OnboardNotifier with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<void> completeOnBoarding(BuildContext context) async {
    await OnboardService.setonBoardCompled();
    Navigator.pushReplacementNamed(context, '/auth');
  }
}
