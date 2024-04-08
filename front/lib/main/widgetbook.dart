// widgetbook.dart

import 'package:flutter/material.dart';
// Import the generated directories variable
import 'package:front/main/widgetbook.directories.g.dart';
import 'package:front/shared/theme/theme.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: themeData,
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        ),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
        LocalizationAddon(
          locales: [const Locale('en', 'US'), const Locale('ko', 'KR')],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        DeviceFrameAddon(devices: [
          Devices.ios.iPhoneSE,
          Devices.ios.iPhone13,
        ], initialDevice: Devices.ios.iPhone13),
      ],
      integrations: [
        // To make addons & knobs work with Widgetbook Cloud
        WidgetbookCloudIntegration(),
      ],
    );
  }
}

class WidgetBookContainer extends StatelessWidget {
  const WidgetBookContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Expanded(child: Center(child: child)));
  }
}
