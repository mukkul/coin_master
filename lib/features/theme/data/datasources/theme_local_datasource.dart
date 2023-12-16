import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDataSource {
  final SharedPreferences _prefs;
  ThemeLocalDataSource({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  void setValue(String key, String value) async {
    bool written = await _prefs.setString(key, value);
    if (!written) {
      throw Exception('Error in saving value');
    }
  }

  String? getValue(String key) {
    try {
      return _prefs.getString(key);
    } catch (_) {
      return null;
    }
  }
}
