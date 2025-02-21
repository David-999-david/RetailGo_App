import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static StorageUtils? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageUtils?> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtils._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtils._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // remove
  static Future<bool>? remove(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  // put string
  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  // put int
  static Future<bool>? putInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  // get int
  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  // put double
  static Future<bool>? putDouble(String key, double value) {
    if (_preferences == null) return null;
    return _preferences!.setDouble(key, value);
  }

  // get double
  static double getDouble(String key, {double defValue = 0.0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getDouble(key) ?? defValue;
  }

  // put bool
  static Future<bool>? putBool(String key, bool value) {
    if (_preferences == null) return null;
    return _preferences!.setBool(key, value);
  }

  // get bool
  static bool getBool(String key, {bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  // clear all
  static Future<bool>? clrAll() {
    SharedPreferences prefs = _preferences!;
    return prefs.clear();
  }

  // contain key
  static bool containKey(String key, {bool defValue = false}) {
    if (_preferences == null) return defValue;
    return _preferences!.containsKey(key);
  }
}
