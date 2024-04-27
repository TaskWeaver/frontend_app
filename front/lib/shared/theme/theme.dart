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
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  ),
);


// import 'package:flutter/material.dart';
// import 'package:front/shared/theme/elevated_button_theme.dart';
// import 'package:google_fonts/google_fonts.dart';

// ThemeData themeData = ThemeData(
//   colorScheme: const ColorScheme(
//     background: Colors.white,
//     primary: Color.fromARGB(255, 32, 183, 103),
//     brightness: Brightness.light,
//     error: Colors.red,
//     onBackground: Colors.black,
//     onError: Colors.white,
//     onPrimary: Colors.white,
//     onSecondary: Colors.white,
//     onSurface: Colors.black,
//     secondary: Color.fromARGB(0xff, 0x20, 0xB7, 0x67),
//     surface: Colors.white,
//   ),
//   elevatedButtonTheme: elevatedButtonThemeData,
//   textTheme: TextTheme(
//     headlineLarge: textStyle(
//       fontSize: 40,
//       fontWeight: FontWeight.w300,
//       letterSpacing: -1.5,
//     ),
//     headlineMedium: Googlefonts.notosans(
//       fontSize: 32,
//       fontWeight: FontWeight.w300,
//       letterSpacing: -0.5,
//     ),
//     headlineSmall: Googlefonts.notosans(
//       fontSize: 24,
//       fontWeight: FontWeight.w400,
//     ),
//     bodyLarge: Googlefonts.notosans(
//       fontSize: 18,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.5,
//     ),
//     bodyMedium: Googlefonts.notosans(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.25,
//     ),
//     bodySmall: Googlefonts.notosans(
//       fontSize: 10,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.25,
//     ),
//     labelSmall: Googlefonts.notosans(
//       fontSize: 14,
//       fontWeight: FontWeight.w700,
//     ),
//     labelMedium: Googlefonts.notosans(
//       fontSize: 18,
//       fontWeight: FontWeight.w700,
//     ),
//     labelLarge: Googlefonts.notosans(
//       fontSize: 22,
//       fontWeight: FontWeight.w700,
//     ),
//   ),
// );
