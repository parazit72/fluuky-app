import 'package:flutter/material.dart';
import 'package:fluuky/data/local/local_storage.dart';

class ThemeProvider extends ChangeNotifier {
  late String _isDark;
  late final LocalStorage appStoragePref;

  String get isDark => _isDark;

  ThemeProvider() {
    _isDark = "false";
    appStoragePref = LocalStorage();
    getPreferences();
  }

  set isDark(String value) {
    _isDark = value;
    appStoragePref.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await appStoragePref.getTheme();
    notifyListeners();
    if (_isDark == "") {
      if (MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).platformBrightness == Brightness.dark) {
        _isDark = "true";
        appStoragePref.setTheme("true");
      } else {
        _isDark = "false";
        appStoragePref.setTheme("false");
      }
    } else {
      _isDark = await appStoragePref.getTheme();
      notifyListeners();
    }
  }
}
