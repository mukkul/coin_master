import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static late SharedPreferences _sharedPreferences;
  static Future<SharedPreferences> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences;
  }

  bool getBoolFromPref(String key) {
    bool? value = _sharedPreferences.getBool(key);
    if (value == null) {
      return false;
    } else {
      return value;
    }
  }
}
