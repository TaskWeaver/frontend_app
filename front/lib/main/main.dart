import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/config/routes.dart';
import 'package:front/core/user/data_sources/rivorpod.dart';
import 'package:front/main/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration

    /// {@category Architecture}
    var config = AppConfig.of(context)!;
    return _EagerInitialization(
        child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: config.appName,
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
    // providers를 감시하여 이른 초기화(Eagerly initialize)합니다.
    // "watch"를 사용하면 provider가 폐기(disposed)되지 않고 계속 살아 있습니다.
    ref.watch(sharedPrefProvider);
    return child;
  }
}
