/*
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getDateShared({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static dynamic getDateSharedInt({
    required String key,
  }) {
    return sharedPreferences.getInt(key);
  }

  static Future<bool> saveDateSharedInt({
    required String key,
    @required dynamic value,
  }) async {
    return await sharedPreferences.setInt(key, value);
  }

  static Future<bool> saveDateShared({
    required String key,
    @required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return await sharedPreferences.setStringList(key, value);
  }

  static Future<bool> removeDateShared({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
*/
