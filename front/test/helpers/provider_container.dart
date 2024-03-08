import 'package:flutter_riverpod/flutter_riverpod.dart';

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  var container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  return container;
}