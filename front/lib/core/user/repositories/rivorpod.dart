import 'package:front/core/user/data_sources/rivorpod.dart';
import 'package:front/core/user/repositories/auth_repository.dart';
import 'package:front/core/user/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rivorpod.g.dart';

@riverpod
AuthRepository authRepository(
  AuthRepositoryRef ref,
) {
  var userRemoteDataSource = ref.watch(userRemoteDataSourceProvider);
  var userLocalDataSource = ref.watch(userLocalDataSourceProvider);
  return AuthRepositoryImpl(
      userRemoteDataSource: userRemoteDataSource,
      userLocalDataSource: userLocalDataSource);
}

@riverpod
UserRepository userRepository(
  UserRepositoryRef ref,
) {
  var userRemoteDataSource = ref.watch(userRemoteDataSourceProvider);
  var userLocalDataSource = ref.watch(userLocalDataSourceProvider);
  return UserRepositoryImpl(
      userRemoteDataSource: userRemoteDataSource,
      userLocalDataSource: userLocalDataSource);
}
