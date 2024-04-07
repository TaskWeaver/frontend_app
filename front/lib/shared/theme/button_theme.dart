import 'package:flutter/material.dart';
import 'package:front/shared/theme/theme.dart';

Color? getBackgroundColor(Set<MaterialState> states) {
  if(states.contains(MaterialState.disabled)) {
    return Colors.grey;
  }
  return themeData.primaryColor;
}

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) => null),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
