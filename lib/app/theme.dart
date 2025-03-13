import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF42B4CA),
      secondary: Color(0xFFD5E9ED),
      surface: Colors.white,
      onSurface: Color(0xFFB5C4C7),
      error: Color(0xFF414A4C),
      tertiary: Color(0xFFB5C4C7)
    ),
  );
}
