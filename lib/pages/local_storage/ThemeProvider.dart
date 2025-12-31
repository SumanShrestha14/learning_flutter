import 'package:first_app/pages/local_storage/LocalStorage.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> loadTheme() async {
    _isDark = await LocalStorage.getTheme();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    await LocalStorage.saveTheme(_isDark);
    notifyListeners();
  }
}
