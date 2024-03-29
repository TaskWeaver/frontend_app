import 'package:front/core/config/providers/secure_storage.dart';
import 'package:front/features/login/data_sources/rivorpod.dart';

import 'package:front/features/login/repositories/auth_repository.dart';
import 'package:front/features/login/repositories/user_repository.dart';
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
  var secureStorage = ref.watch(secureStorageProvider);
  return UserRepositoryImpl(
    userRemoteDataSource: userRemoteDataSource,
    userLocalDataSource: userLocalDataSource,
  );
}
