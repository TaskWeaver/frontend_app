import 'package:dio/dio.dart';
import 'package:front/core/network_handling/app_dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var dio = AppDio.instance;

  return dio;
}
