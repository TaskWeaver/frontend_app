import 'package:flutter/material.dart';
import 'package:front/config/routes.dart';

/// {@category Architecture}
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: nameRoutes,
    );
  }
}
