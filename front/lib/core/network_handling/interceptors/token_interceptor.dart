import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/core/const/const.dart';

class TokenInterceptor implements InterceptorsWrapper {
  final FlutterSecureStorage storage;

  TokenInterceptor({required this.storage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = options.headers.remove('accessToken') == 'true';

    if (!accessToken) return handler.next(options);

    final token = await storage.read(key: accessTokenKey);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: 토큰 유효하지 않을 경우 로그아웃 로직 넣기
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}