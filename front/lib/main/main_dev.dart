import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/main/app_config.dart';
import 'package:front/main/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // add this

  LocaleSettings.useDeviceLocale(); //

  var configuredApp = const AppConfig(
    appName: 'Build flavors DEV',
    flavorName: 'development',
    apiBaseUrl: 'https://dev.taskWeaver.com/',
    child: MyApp(),
  );

  runApp(ProviderScope(child: TranslationProvider(child: configuredApp)));
}
