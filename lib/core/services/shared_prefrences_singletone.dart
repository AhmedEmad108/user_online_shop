import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    instance.setBool(key, value);
  }

  static getBool(String key) {
    return instance.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    await instance.setString(key, value);
  }

  static getString(String key) {
    return instance.getString(key) ?? '';
  }

  static Future<void> deleteString(String key) async {
    await instance.remove(key);
  }

  static Future<void> deleteAll() async {
    await instance.clear();
  }
}
