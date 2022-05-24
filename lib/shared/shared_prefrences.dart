import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static final CacheHelper instance = CacheHelper._();

  CacheHelper._();

  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('CacheHelper created');
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) {
    return sharedPreferences!.remove(key);
  }

  static Future<bool> saveData({
    required key,
    required value
  }) async {
    if(value is bool) return await sharedPreferences!.setBool(key, value);
    if(value is double) return await sharedPreferences!.setDouble(key, value);
    if(value is int)  return await sharedPreferences!.setInt(key, value);
    if(value is List<String>)  return await sharedPreferences!.setStringList(key, value);

    return await sharedPreferences!.setString(key, value);
  }
}