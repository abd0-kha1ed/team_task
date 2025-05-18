import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  /// Initializes SharedPreferences instance
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Gets string value by key
  static String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  /// Gets value of any type by key
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  /// Saves value of any type (String, bool, int, double) by key
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  /// Removes a value by key
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  /// Checks if key exists in storage
  static bool containsKey({required String key}) {
    return sharedPreferences.containsKey(key);
  }

  /// Clears all saved data
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  /// Alias for saveData (optional)
  static Future<bool> put({required String key, required dynamic value}) async {
    return await saveData(key: key, value: value);
  }

  static Future<bool> removeToken({required String tokenKey}) async {
    // أو أي اسم المفتاح اللي مخزنة عليه التوكن عندك
    return await sharedPreferences.remove(tokenKey);
  }
}
