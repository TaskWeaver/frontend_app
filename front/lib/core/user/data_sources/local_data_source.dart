import 'dart:convert';

import 'package:front/core/const/const.dart';
import 'package:front/core/user/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource {
  UserLocalDataSource({
    required this.sharedPreferences,
  });

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

  Future<bool> isAuthenticated() async {
    return sharedPreferences.getBool(IS_AUTHENTICATED_KEY) ?? false;
  }

  Future<bool> setAuthenticated(bool value) async {
    return await sharedPreferences.setBool(IS_AUTHENTICATED_KEY, value);
  }
}
