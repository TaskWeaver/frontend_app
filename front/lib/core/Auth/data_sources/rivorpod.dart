import 'package:front/core/Auth/data_sources/remote_data_source.dart';
import 'package:front/core/config/providers/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rivorpod.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(
  AuthRemoteDataSourceRef ref,
) {
  var dio = ref.watch(dioProvider);
  return AuthRemoteDataSourceImpl(dio: dio);
}
