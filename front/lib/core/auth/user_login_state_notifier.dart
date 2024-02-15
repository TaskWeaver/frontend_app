import 'package:front/core/Auth/models/auth_state.dart';
import 'package:front/core/Auth/models/user.dart';
import 'package:front/core/Auth/repositories/auth_rivorpod.dart';
import 'package:front/core/config/providers/secureStorage.dart';
import 'package:front/core/const/const.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_login_state_notifier.g.dart';

/// UserMeNotifier 클래스
///
/// 사용자의 로그인 상태를 관리하는 Notifier 클래스입니다.
/// 현재 사용자의 상태를 제공하며, 로그인, 로그아웃 등의 로직을 구현합니다.
@riverpod
class UserLoginState extends _$UserLoginState {
  @override
  // 첫 state는 Loading 상태
  AuthState build() {
    state = const AuthState.loading();
    return state;
  }

  Future<UserModel?> getMe() async {
    try {
      var storage = ref.read(secureStorageProvider);
      var accessToken = await storage.read(key: accessTokenKey);
      var refreshToken = await storage.read(key: refreshTokenKey);
      // Access Token과 Refresh Token이 모두 존재하는 경우
      if (accessToken == null || refreshToken == null) {
        state = const AuthState.loggedOut();
        return null;
      }
      UserModel? userModel;
      // getMe()를 호출하여 사용자 정보를 가져옴
      var response = await ref.read(authRepositoryProvider).getMe();

      // getMe()의 결과에 따라 state를 변경
      response.fold((l) => state = AuthState.error(message: l.message), (r) {
        var userLoginResponse = UserModel(
          type: r.type,
          accessToken: accessToken,
          refreshToken: refreshToken,
          email: r.email,
          nickname: r.nickname,
          imageUrl: r.imageUrl,
          id: r.id,
        );

        state = AuthState(userLoginResponse);
        userModel = r;
      });

      return userModel;
    } catch (e) {
      state = AuthState.error(message: e.toString());
      return null;
    }
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    var authRepository = ref.read(authRepositoryProvider);

    var storage = ref.read(secureStorageProvider);

    var response = await authRepository.signIn(
      email: email,
      password: password,
    );

    response.fold((l) => state = AuthState.error(message: l.message),
        (r) async {
      // secure storage에 Token 보관
      state = AuthState(r);
      await storage.write(key: accessTokenKey, value: r.accessToken);
      await storage.write(key: refreshTokenKey, value: r.refreshToken);
    });
    //UserMeNotifier 에서 자기의 현재 로그인 정보를 가져오기
    var userInfo = await authRepository.getMe();

    return userInfo.fold((l) => throw Exception('$l.message'), (r) => r);
  }

  Future<void> logout() async {
    state = const AuthState.loading();
    var storage = ref.read(secureStorageProvider);

    //로그아웃된 state 를 처리하기
    state = const AuthState.loggedOut();

    // Secure Storage에서 Access Token과 Refresh Token 삭제
    await Future.wait([
      storage.delete(key: accessTokenKey),
      storage.delete(key: refreshTokenKey),
    ]);
  }
}
