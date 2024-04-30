import 'package:dio/dio.dart' hide Headers;
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:retrofit/http.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserAPI {
  factory UserAPI(Dio dio, {String baseUrl}) = _UserAPI;

//태스크 생성
  @POST('/auth/sign-up')
  Future<ApiResponse<SignUpResponse>> signUp({
    @Body() required SignUpRequest signUpRequest,
  });

//프로젝트에 해당하는 모든 테스크 가져오기
  @POST('/auth/sign-in')
  Future<ApiResponse<SignInResponse>> signIn({
    @Body() required SignInRequest signInRequest,
  });

  @GET('/user')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse<UserModel>> getUserInfo();

  @PATCH('/user/password')
  @Headers({'accessToken': 'true'})
  Future<ApiResponse> changePassword({
    @Body() required ChangePassword changePassword,
  });
}
