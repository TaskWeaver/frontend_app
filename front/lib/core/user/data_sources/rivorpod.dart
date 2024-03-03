import 'package:front/core/config/providers/dio.dart';
import 'package:front/core/config/providers/secure_storage.dart';
import 'package:front/core/user/data_sources/local_data_source.dart';
import 'package:front/core/user/data_sources/remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rivorpod.g.dart';

@riverpod
UserRemoteDataSource userRemoteDataSource(
  UserRemoteDataSourceRef ref,
) {
  var dio = ref.watch(dioProvider);
  return UserRemoteDataSourceImpl(dio: dio);
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPref(SharedPrefRef ref) async {
  return await SharedPreferences.getInstance();
}

@riverpod
UserLocalDataSource userLocalDataSource(UserLocalDataSourceRef ref) {
  var sharedPrefs = ref.read(sharedPrefProvider).requireValue;
  var secureStorage = ref.read(secureStorageProvider);
  return UserLocalDataSource(
      sharedPreferences: sharedPrefs, secureStorage: secureStorage);
}
