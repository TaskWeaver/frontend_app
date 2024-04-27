import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required UserRemoteDataSource userRemoteDataSource,
    required UserLocalDataSource userLocalDataSource,
  })  : _userRemoteDataSource = userRemoteDataSource,
        _userLocalDataSource = userLocalDataSource;

  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;
  @override
  Future<Result<ApiResponse>> signIn(SignInRequest signInRequest) async {
    try {
      var result = await _userRemoteDataSource.signIn(signInRequest);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> signOut() {
    // TODO: implement signOut
    // 저장되어 있는 토큰 삭제

    throw UnimplementedError();
  }

  @override
  Future<Result<ApiResponse>> signUp(SignUpRequest signUpRequest) async {
    try {
      var result = await _userRemoteDataSource.signUp(signUpRequest);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<bool>> autoSignInCheck() async {
    try {
      var isAutoSignIn = await _userLocalDataSource.autoSignInCheck();
      var isToken = await _userLocalDataSource.tokenCheck();

      return Result.success(isAutoSignIn && isToken);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> changePassword(
      ChangePassword changePassword) async {
    try {
      var result = await _userRemoteDataSource.changePassword(changePassword);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<UserModel>>> getUserInfo() async {
    //DataSource 에서 user 정보 받기
    try {
      var result = await _userRemoteDataSource.getUserInfo();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result> setAutoSignInTrue() async {
    try {
      await _userLocalDataSource.setAutoSignInTrue();
      return Result.success(0);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result> setAutoSignInFalse() async {
    try {
      await _userLocalDataSource.setAutoSignInFalse();
      return Result.success(0);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result> saveToken(TokenModel token) async {
    try {
      var result = await _userLocalDataSource.saveToken(token);
      return Result.success(0);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<TokenModel>> getToken() async {
    try {
      var result = await _userLocalDataSource.getToken();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<bool>> checkToken() async {
    try {
      var result = await _userLocalDataSource.tokenCheck();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
