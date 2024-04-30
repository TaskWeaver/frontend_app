import 'package:front/core/utils/api_response.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<ApiResponse<UserModel>> getUserInfo();
  Future<ApiResponse<SignInResponse>> signIn(SignInRequest signInRequest);
  Future<ApiResponse<SignUpResponse>> signUp(SignUpRequest signUpRequest);
  Future<ApiResponse> changePassword(ChangePassword changePassword);
}
