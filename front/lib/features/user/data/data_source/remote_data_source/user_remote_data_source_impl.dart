import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/user/data/api/user_api.dart';
import 'package:front/features/user/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/data/models/user.dart';

final class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserAPI _UserAPI = UserAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  @override
  Future<ApiResponse> changePassword(ChangePassword changePassword) {
    return _UserAPI.changePassword(changePassword: changePassword);
  }

  @override
  Future<ApiResponse<UserModel>> getUserInfo() {
    return _UserAPI.getUserInfo();
  }

  @override
  Future<ApiResponse<SignInResponse>> signIn(SignInRequest signInRequest) {
    return _UserAPI.signIn(signInRequest: signInRequest);
  }

  @override
  Future<ApiResponse<SignUpResponse>> signUp(SignUpRequest signUpRequest) {
    return _UserAPI.signUp(signUpRequest: signUpRequest);
  }
}
