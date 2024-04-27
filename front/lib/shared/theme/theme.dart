import 'package:flutter/material.dart';
import 'package:front/shared/theme/elevated_button_theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.notoSans(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headlineMedium: GoogleFonts.notoSans(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headlineSmall: GoogleFonts.notoSans(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: GoogleFonts.notoSans(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    bodySmall: GoogleFonts.notoSans(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelSmall: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: GoogleFonts.notoSans(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: GoogleFonts.notoSans(
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  ),
);
