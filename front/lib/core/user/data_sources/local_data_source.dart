import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/core/const/const.dart';
import 'package:front/core/user/models/token.dart';
import 'package:front/core/user/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  UserLocalDataSource({
    required this.sharedPreferences,
    required this.secureStorage,
  });
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  Future<UserModel> saveUserInfo(UserModel user) async {
    await sharedPreferences.setString(
        AUTHENTICATED_USER_EMAIL_KEY, json.encode(user.toJson()));

    return user;
  }

  Future<UserModel?> getUserInfo() async {
    var userString = sharedPreferences.getString(AUTHENTICATED_USER_EMAIL_KEY);
    if (userString != null) {
      return UserModel.fromJson(json.decode(userString));
    }
    return null;
  }

  Future<bool> clearUserInfo() async {
    return await sharedPreferences.remove(AUTHENTICATED_USER_EMAIL_KEY);
  }

  Future<bool> getAuthenticated() async {
    return sharedPreferences.getBool(IS_AUTHENTICATED_KEY) ?? false;
  }

  Future<bool> setAuthenticated(bool value) async {
    return await sharedPreferences.setBool(IS_AUTHENTICATED_KEY, value);
  }

  Future<void> saveToken(Token token) async {
    await secureStorage.write(key: accessTokenKey, value: token.accessToken);
    await secureStorage.write(key: refreshTokenKey, value: token.refreshToken);
  }

  Future<Token?> getToken() async {
    var accessToken = await secureStorage.read(key: accessTokenKey);
    var refreshToken = await secureStorage.read(key: refreshTokenKey);
    if (accessToken != null && refreshToken != null) {
      return Token(accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  Future<bool> clearToken() async {
    try {
      await secureStorage.delete(key: accessTokenKey);
      await secureStorage.delete(key: refreshTokenKey);
      return true;
    } catch (e) {
      return false;
    }
  }
}
