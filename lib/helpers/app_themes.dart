import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: const Color(0xFFF7F5EF),
    cardColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF222222)),
      bodyMedium: TextStyle(color: Color(0xFF222222)),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.amber,
      secondary: Color(0xFFB6E2B6),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFF222222),
      error: Colors.red,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: const Color(0xFF262C36),
    cardColor: const Color(0xFF323846),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.amber,
      secondary: Color(0xFF6FCF97),
      surface: Color(0xFF323846),
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      error: Colors.redAccent,
    ),
  );
}
