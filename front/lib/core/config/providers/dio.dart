import 'package:dio/dio.dart';
import 'package:front/core/config/custom_interceptor.dart';
import 'package:front/core/config/providers/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var dio = Dio(
    BaseOptions(
      baseUrl:
          'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );

  var storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(
    CustomInterceptor(storage: storage, ref: ref),
  );

  return dio;
}
