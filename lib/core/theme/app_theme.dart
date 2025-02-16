// core/theme/app_theme.dart
import 'package:flutter/material.dart';

import 'light_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xffE9EEFA),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    // Add more theme configurations
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xff1A1A1A),
    scaffoldBackgroundColor: Color(0xff0D0D0D),
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    // Add more theme configurations
  );
}