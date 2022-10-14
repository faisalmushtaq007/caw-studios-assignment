import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// light theme and dark theme
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  SharedPreferences? prefs;

  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
      if(prefs == null){
            prefs = await SharedPreferences.getInstance();
      }
  }

  loadPrefs() async{
    await _initPrefs();
    themeMode = prefs!.getBool('isDark') ?? false ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  _saveToPrefs() async{
    await _initPrefs();
    prefs!.setBool('isDark', isDark);
  }
}