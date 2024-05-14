import 'package:front/features/user/data/models/token.dart';

abstract class UserLocalDataSource {
  Future<void> saveToken(TokenModel token);
  Future<TokenModel> getToken();
  Future<void> deleteToken();
  Future<bool> checkToken();
  Future<void> signOut();
  //Future<UserModel> getUserInfo();
  //Future<void> saveUserInfo(UserModel usermodel);

  Future<bool> autoSignInCheck();
  Future<void> setAutoSignInTrue();
  Future<void> setAutoSignInFalse();
}
