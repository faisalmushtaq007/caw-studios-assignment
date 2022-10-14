import 'package:flutter/material.dart';

class Helper {
  static Color primary = Color(0xFF00A981);
  static Color secondary = Color(0xFFBA9D9D);


  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade700,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(secondary: primary, primary: Colors.blueGrey),
    iconTheme: IconThemeData(color: Colors.white),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white, titleTextStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w600)),
    primaryColor: primary,
    colorScheme:
        ColorScheme.light(secondary: primary, primary: Colors.blueGrey),
    iconTheme: IconThemeData(color: primary),
  );

}