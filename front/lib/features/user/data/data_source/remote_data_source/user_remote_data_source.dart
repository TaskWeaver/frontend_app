import 'package:front/features/user/data/models/change_password_model.dart';
import 'package:front/features/user/data/models/sign_in_request_model.dart';
import 'package:front/features/user/data/models/sign_in_response_model.dart';
import 'package:front/features/user/data/models/sign_up_request_model.dart';
import 'package:front/features/user/data/models/sign_up_response_model.dart';
import 'package:front/features/user/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserInfo();
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequest);
  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpRequest);
  Future<void> changePassword(ChangePasswordModel changePassword);
}
