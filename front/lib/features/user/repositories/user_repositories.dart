import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/data/models/user.dart';

abstract class UserRepository {
  Future<Result<ApiResponse<UserModel>>> getUserInfo();

  Future<Result<ApiResponse>> changePassword(ChangePassword changePassword);

  Future<Result<ApiResponse>> signUp(SignUpRequest signUpRequest);
  Future<Result<ApiResponse>> signIn(SignInRequest signInRequest);
  Future<Result<ApiResponse>> signOut();

  /// setAutoSignInCheck == true && tokenCheck == true 가 만족해야 autoSignIn 가능
  Future<Result<bool>> autoSignInCheck();

  Future<Result> setAutoSignInTrue();
  Future<Result> setAutoSignInFalse();

  Future<Result> saveToken(TokenModel token);
  Future<Result<TokenModel>> getToken();

  Future<Result<bool>> checkToken();
}
