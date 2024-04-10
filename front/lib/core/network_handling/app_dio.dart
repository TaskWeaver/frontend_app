import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:front/app/locator.dart';
import 'package:front/core/network_handling/interceptors/logger_interceptor.dart';
import 'package:front/core/network_handling/interceptors/token_interceptor.dart';

abstract class AppDio {
  AppDio._internal();

  static Dio? _instance;

  static Dio get instance => _instance ??= _AppDio();
}

class _AppDio with DioMixin implements Dio {
  _AppDio() {
    // final storage = locator<FlutterSecureStorage>();

    httpClientAdapter = IOHttpClientAdapter();
    options = BaseOptions(
      connectTimeout: Duration(milliseconds: 30000),
      receiveTimeout: Duration(milliseconds: 30000),
      sendTimeout: Duration(milliseconds: 30000),
      baseUrl: 'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083',
      receiveDataWhenStatusError: true,
    );

    (transformer as BackgroundTransformer).jsonDecodeCallback = parseJson;

    interceptors.addAll([
      TokenInterceptor(storage: getStorage),
      LoggerInterceptor(),
    ]);
  }
}

// compute 메소드 적용
// 최상단 메소드에서 실행
// compute 함수 내부 에러 핸들링 추가
_parseAndDecode(String response) {
  try {
    return jsonDecode(response);
  } catch (e) {
    throw Exception('Failed to parse JSON');
  }
}

// compute 함수가 메모리 누수를 발생시키지 않도록 수정
Future<dynamic> parseJson(String text) async {
  return compute(_parseAndDecode, text);
}
