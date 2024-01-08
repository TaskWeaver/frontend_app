import 'package:flutter/material.dart';
import 'package:front/app/config/routes.dart';
import 'package:front/main/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration
    var config = AppConfig.of(context)!;

    return MaterialApp(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      routes: nameRoutes,
    );
  }
}
