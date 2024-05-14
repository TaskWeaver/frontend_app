import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserInfo();
  Future<SignInResponse> signIn(SignInRequest signInRequest);
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest);
  Future<void> changePassword(ChangePassword changePassword);
}
