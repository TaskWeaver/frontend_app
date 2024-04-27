import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/core/const/const.dart';

class TokenInterceptor implements InterceptorsWrapper {
  TokenInterceptor({required this.storage, required this.dio});
  final FlutterSecureStorage storage;
  final Dio dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessTokenRequired = options.headers.remove('accessToken') == 'true';

    if (!accessTokenRequired) return handler.next(options);

    final token = await storage.read(key: accessTokenKey);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await storage.read(key: refreshTokenKey);
      final oldAccessToken = await storage.read(key: accessTokenKey);

      if (refreshToken != null) {
        debugPrint('refresh Token is not null');
        try {
          final response = await dio.post('$apiUrl/v1/user/token', data: {
            'refresh_token': refreshToken,
            'oldAccessToken': oldAccessToken // Removed the extra space in key
          });
          final newAccessToken = response.data['access_token'];
          await storage.write(key: accessTokenKey, value: newAccessToken);
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          return handler.resolve(await dio.request(err.requestOptions.path,
              options: Options(
                  method: err.requestOptions.method,
                  headers: err.requestOptions.headers),
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters));
        } catch (e) {
          // Log out or handle token refresh failure
        }
      }
    }
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
