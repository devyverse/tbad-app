import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';

class ThemeController extends ChangeNotifier {
  static final ThemeController instance = ThemeController._internal();
  ThemeController._internal();

  static const _key = "themeMode";

  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  Future<void> load() async{
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);

    switch (value) {
      case "light":
        _mode = ThemeMode.light;
        break;
      case "dark":
        _mode = ThemeMode.dark;
        break;
      default:
        _mode = ThemeMode.system;
    }

    notifyListeners();
  }

  Future<void> setMode(ThemeMode mode) async {
    _mode = mode;
    final prefs = await SharedPreferences.getInstance();

    switch (mode) {
      case ThemeMode.light:
        prefs.setString(_key, "light");
        break;
      case ThemeMode.dark:
        prefs.setString(_key, "dark");
        break;
      default:
        prefs.setString(_key, "system");
    }

    notifyListeners();
  }
}
