import 'package:front/core/user/data_sources/rivorpod.dart';
import 'package:front/core/user/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_rivorpod.g.dart';

@riverpod
AuthRepository authRepository(
  AuthRepositoryRef ref,
) {
  var authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(authRemoteDataSource: authRemoteDataSource);
}
