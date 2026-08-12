import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final String key;

  StorageService(this.key);

  Future<List<Map<String, dynamic>>> readList() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(key);
      if (raw == null) return [];
      return List<Map<String, dynamic>>.from(jsonDecode(raw));
    } else {
      // mobile version later if needed
      return [];
    }
  }

  Future<void> writeList(List<Map<String, dynamic>> data) async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, jsonEncode(data));
    } else {
      // mobile version later
    }
  }
}
