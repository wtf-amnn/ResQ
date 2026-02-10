import 'package:flutter/material.dart';

// Custom Material 3 theme using White, Black, Green colors [web:1][web:9]
final ThemeData resQTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.light,
    primary: Colors.green,
    onPrimary: Colors.white,
    secondary: Colors.green.shade600,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
    background: Colors.white,
    onBackground: Colors.black,
    error: Colors.red,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black87,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.black54,
    type: BottomNavigationBarType.fixed,
  ),
);
