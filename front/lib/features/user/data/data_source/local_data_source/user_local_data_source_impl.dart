import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/app/shared_preferences_service.dart';
import 'package:front/core/const/const.dart';
import 'package:front/features/user/data/data_source/local_data_source/user_local_data_source.dart';
import 'package:front/features/user/data/models/token_model.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl(
      {required this.flutterSecureStorage, required this.sharedPreferences});
  final FlutterSecureStorage flutterSecureStorage;
  final SharedPreferencesService sharedPreferences;

  static const autoSigninKey = 'auto_Signin';
  @override
  Future<void> saveToken(TokenModel token) {
    return Future.wait([
      flutterSecureStorage.write(key: accessTokenKey, value: token.accessToken),
      flutterSecureStorage.write(
          key: refreshTokenKey, value: token.refreshToken),
    ]);
  }

  @override
  Future<void> deleteToken() {
    return Future.wait([
      flutterSecureStorage.delete(key: accessTokenKey),
      flutterSecureStorage.delete(key: refreshTokenKey),
    ]);
  }

  @override
  Future<TokenModel> getToken() {
    return Future.wait([
      flutterSecureStorage.read(key: accessTokenKey),
      flutterSecureStorage.read(key: refreshTokenKey),
    ]).then((value) => TokenModel(
          accessToken: value[0] ?? '',
          refreshToken: value[1] ?? '',
        ));
  }

  @override
  Future<bool> checkToken() {
    return Future.wait([
      flutterSecureStorage.read(key: accessTokenKey),
      flutterSecureStorage.read(key: refreshTokenKey),
    ]).then((value) => value[0] != null && value[1] != null);
  }

  @override
  Future<bool> autoSignInCheck() async {
    var isSignin = false;
    if (sharedPreferences.getBool(autoSigninKey) == true) {
      isSignin = true;
    }
    return isSignin;
  }

  @override
  Future<void> setAutoSignInFalse() {
    return sharedPreferences.setBool(autoSigninKey, false);
  }

  @override
  Future<void> setAutoSignInTrue() async {
    await sharedPreferences.setBool(autoSigninKey, true);
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      flutterSecureStorage.delete(key: accessTokenKey),
      flutterSecureStorage.delete(key: refreshTokenKey),
    ]);
  }
}
