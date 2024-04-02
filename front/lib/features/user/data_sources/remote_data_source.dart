import 'package:dio/dio.dart';
import 'package:front/features/user/models/user.dart';

///서버와 통신하는 함수를 모아놓은 클래스
///서버와의 통신에 실패하면 Exception을 던집니다.
abstract class UserRemoteDataSource {
  Future<UserRegistrationResponse> signUp(
      UserRegistrationRequest userRegistrationRequest);
  Future<LoginResponse> signIn(String email, String password);
  Future<UserModel> getMe();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<UserRegistrationResponse> signUp(
      UserRegistrationRequest userRegistrationRequest) async {
    var response = await dio.post(
      '/v1/auth/sign-up',
      data: {
        'email': userRegistrationRequest.email,
        'password': userRegistrationRequest.password,
        'nickname': userRegistrationRequest.nickname,
        'imageUrl': 'example',
      },
    );

    if (response.statusCode == 200) {
      return UserRegistrationResponse.fromJson(response.data['result']);
    } else {
      throw Exception('회원가입 실패');
    }
  }

  @override
  Future<LoginResponse> signIn(String email, String password) async {
    try {
      var response = await dio.post(
        '/v1/auth/sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var loginResponse = LoginResponse.fromJson(response.data['result']);

        return loginResponse;
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      throw Exception('An error occurred');
    }
  }

  //TODO: 토큰 재발급 로직 추가

  // @override
  // Future<TokenResponse> token() async {
  //   final response = await dio.post(
  //     '$baseUrl/token',
  //     options: Options(
  //       headers: {
  //         'refreshToken': 'true',
  //       },
  //     ),
  //   );

  //   return TokenResponse.fromJson(response.data);
  // }
  @override
  Future<UserModel> getMe() async {
    dio.options.headers = {'accessToken': 'true'};
    var response = await dio.get('/v1/user');
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data['result']);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
