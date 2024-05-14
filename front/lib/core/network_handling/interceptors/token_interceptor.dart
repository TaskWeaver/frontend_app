import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/locator.dart';
import 'package:front/core/const/const.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor({required this.storage, required this.dio});
  final FlutterSecureStorage storage;
  final Dio dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessTokenRequired = options.headers.remove('accessToken') == 'true';

    if (!accessTokenRequired) return handler.next(options);

    final token = await storage.read(key: accessTokenKey);
    debugPrint('TokenInterceptor: $token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (err.requestOptions.headers.containsKey('retried')) {
        // Already retried, do not retry again
        return handler.next(err);
      }

      final refreshToken = await storage.read(key: refreshTokenKey);

      final oldAccessToken = await storage.read(key: accessTokenKey);

      if (refreshToken != null) {
        debugPrint('Attempting to refresh token...');
        try {
          final response = await dio.post('/v1/user/token', data: {
            'refresh_token': refreshToken,
            'oldAccessToken': oldAccessToken
          });
          final newAccessToken = response.data['access_token'];
          await storage.write(key: accessTokenKey, value: newAccessToken);

          // Add retry flag to RequestOptions
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          err.requestOptions.headers['retried'] =
              'true'; // Flag to prevent multiple retries

          final retryResponse = await dio.fetch(err.requestOptions);
          return handler.resolve(retryResponse);
        } catch (e) {
          debugPrint('Failed to refresh token: $e');
          await storage.deleteAll(); // Clear all stored keys
          authController.isToken = false;
          return handler.reject(err);
        }
      }
    }

    // Continue with any other error handling
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
