import 'package:dio/dio.dart';
import 'package:front/core/Auth/models/user.dart';

///서버와 통신하는 함수를 모아놓은 클래스
///서버와의 통신에 실패하면 Exception을 던집니다.
abstract class AuthRemoteDataSource {
  Future<UserRegistrationResponse> signUp(
      UserRegistrationRequest UserRegistrationRequest);
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> getMe();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<UserRegistrationResponse> signUp(
      UserRegistrationRequest userRegistrationRequest) async {
    print(dio.options.baseUrl);
    print(userRegistrationRequest);
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
      print('회원가입 성공');
      print('${response.data['result']}');
      return UserRegistrationResponse.fromJson(response.data['result']);
    } else {
      throw Exception('회원가입 실패');
    }
  }

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      print('SignIn() 호출');
      print('이메일 : $email, 비밀번호 : $password');

      var response = await dio.post(
        '/v1/auth/sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('로그인 응답 데이터: ${response.data}');
        var userLoginResponse = UserModel.fromJson(response.data['result']);
        print(userLoginResponse);
        return userLoginResponse;
      } else {
        print('로그인 시도 실패: ${response.data}');
        throw Exception('An error occurred');
      }
    } catch (e) {
      print('로그인 요청 에러: $e');
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
      print('유저정보 얻어오기: ${response.data}');
      return UserModel.fromJson(response.data['result']);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
