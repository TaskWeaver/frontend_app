import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/core/const/const.dart';

class TokenInterceptor  implements Interceptor {
  // TokenInterceptor({required this.storage});

  // final FlutterSecureStorage storage;


  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken =
        options.headers.remove('accessToken') == 'true';

    if (!accessToken) return handler.next(options);
    // var storage = ref.watch(secureStorageProvider);


    // var token = await storage.read(key: accessTokenKey);
    final token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxOkRFRkFVTFQiLCJpc3MiOiJUYXNrV2VhdmVyIiwiaWF0IjoxNzEwODM1MzAxLCJleHAiOjE3MTA5NDMzMDF9.uCxdUgxzxXVUr0jBWct6L5xtu8q3veWaMZyfE4-OgddngwShmW4dRWuPK7CPr1CnpK21tuMEdJCVIhnA3ehVQg";

    print('access token $token');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: 토큰 유효하지 않을 경우 로그아웃 로직 넣기
    return handler.next(err);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }
}
