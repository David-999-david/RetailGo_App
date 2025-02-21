import 'package:shared_preferences/shared_preferences.dart';

class OnboardService {
  // for store in shared preferences;
  static const String _isonBoard = 'isonBoardCompled';

  //first onBoard pages will show when first running app, after setonboardcompled is work => the app will never show onboard
  static Future<void> setonBoardCompled() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isonBoard, true);
  }

  //until setonboardcompled is work => set isonboard to true => this isonboardcompled get boll from prefs => will return false;
  //for check in main is onboardcompled is false the app will show onboard pages , else never show directly go to login or product screen
  static Future<bool> isonBoardCompled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isonBoard) ?? false;
  }
}
