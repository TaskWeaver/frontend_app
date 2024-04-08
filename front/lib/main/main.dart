import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/config/routes.dart';
import 'package:front/core/config/providers/secure_storage.dart';
import 'package:front/features/user/data_sources/rivorpod.dart';
import 'package:front/main/app_config.dart';
import 'package:front/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration

    /// {@category Architecture}
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    debugPrint('width: $width, height: $height');
    var config = AppConfig.of(context)!;
    return _EagerInitialization(
        child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: config.appName,
      theme: themeData,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    ));
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sharedPrefProvider);
    ref.watch(secureStorageProvider);

    return child;
  }
}
