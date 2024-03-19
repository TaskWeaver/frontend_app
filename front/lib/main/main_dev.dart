import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/locator.dart';
import 'package:front/main/app_config.dart';
import 'package:front/main/main.dart';

void main() {
  initLocator();
  var configuredApp = const AppConfig(
    appName: 'Build flavors DEV',
    flavorName: 'development',
    apiBaseUrl: 'https://dev.taskWeaver.com/',
    child: MyApp(),
  );

  runApp(ProviderScope(child: configuredApp));
}
