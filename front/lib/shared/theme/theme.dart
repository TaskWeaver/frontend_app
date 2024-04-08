import 'package:flutter/material.dart';
import 'package:front/shared/theme/elevated_button_theme.dart';

ThemeData themeData = ThemeData(
  colorScheme: const ColorScheme(
    background: Colors.white,
    primary: Color.fromARGB(255, 32, 183, 103),
    brightness: Brightness.light,
    error: Colors.red,
    onBackground: Colors.black,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    secondary: Color.fromARGB(0xff, 0x20, 0xB7, 0x67),
    surface: Colors.white,
  ),
  elevatedButtonTheme: elevatedButtonThemeData,
);
