import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static SharedPreferences? _sharedPrefs;

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData<T>(String key, T value) async {
    if (_sharedPrefs == null) await init();


    if (value is String) {
      return await _sharedPrefs!.setString(key, value);
    } else if (value is bool) {
      return await _sharedPrefs!.setBool(key, value);
    } else if (value is int) {
      return await _sharedPrefs!.setInt(key, value);
    } else if (value is double) {
      return await _sharedPrefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _sharedPrefs!.setStringList(key, value);
    } else {
      throw Exception("Invalid type");
    }
  }

  static T? getData<T>(String key) {
    if (_sharedPrefs == null) return null;

    dynamic value;

    if (T == String) {
      value = _sharedPrefs!.getString(key);
    } else if (T == bool) {
      value = _sharedPrefs!.getBool(key);
    } else if (T == int) {
      value = _sharedPrefs!.getInt(key);
    } else if (T == double) {
      value = _sharedPrefs!.getDouble(key);
    } else if (T == List<String>) {
      value = _sharedPrefs!.getStringList(key);
    } else {
      throw Exception("Invalid type");
    }

    return value as T?;
  }



  static Future<bool> removeData(String key) async {
    if (_sharedPrefs == null) await init();
    return await _sharedPrefs!.remove(key);
  }
}
