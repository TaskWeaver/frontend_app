import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/main/app_config.dart';
import 'package:front/main/main.dart';

void main() {
  var configuredApp = const AppConfig(
    appName: 'Build flavors',
    flavorName: 'production',
    apiBaseUrl: 'https://taskWeaver.com/',
    child: MyApp(),
  );

  runApp(ProviderScope(child: TranslationProvider(child: configuredApp)));
}
