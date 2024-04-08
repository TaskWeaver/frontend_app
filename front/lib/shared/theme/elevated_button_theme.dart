import 'package:flutter/material.dart';
import 'package:front/shared/theme/theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Color? getBackgroundColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.dragged) ||
      states.contains(MaterialState.selected)) {
    return themeData.colorScheme.primary.withOpacity(0.92);
  }
  return themeData.colorScheme.primary;
}

Color? getOverlayColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.hovered)) {
    return Colors.black.withOpacity(0.04);
  } else if (states.contains(MaterialState.pressed)) {
    return Colors.black.withOpacity(0.08);
  }
  return Colors.black.withOpacity(0.2);
}

Color? getForegroundColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.disabled)) {
    return themeData.colorScheme.onPrimary.withOpacity(0.35);
  }
  return themeData.colorScheme.onPrimary;
}

TextStyle? getButtonTextStyle(Set<MaterialState> states) {
  return TextStyle(fontSize: 14);
}

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(getBackgroundColor),
    textStyle: MaterialStateProperty.resolveWith(getButtonTextStyle),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        vertical: 24,
      ),
    ),
    foregroundColor: MaterialStateProperty.resolveWith(getForegroundColor),
    overlayColor: MaterialStateProperty.resolveWith(getOverlayColor),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);

@widgetbook.UseCase(
  name: '',
  type: ElevatedButton,
)
Widget elevatedButtonUseCase(BuildContext context) {
  return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed:
                  context.knobs.boolean(label: 'Disabled', initialValue: false)
                      ? null
                      : () {},
              child: Text(context.knobs.string(
                  label: 'Elevated Button Text',
                  initialValue: 'Elevated Button')),
            ),
          ],
        )),
      ),
    );
}
