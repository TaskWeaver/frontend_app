import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:front/core/config/providers/secure_storage.dart';
import 'package:front/core/const/const.dart';
import 'package:front/core/user/repositories/auth_repository.dart';
import 'package:front/core/user/repositories/rivorpod.dart';
import 'package:front/core/user/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

/// UserMeNotifier 클래스
///
/// 사용자의 로그인 상태를 관리하는 Notifier 클래스입니다.
/// 현재 사용자의 상태를 제공하며, 로그인, 로그아웃 등의 로직을 구현합니다.

//AsyncValue 를 통해 로딩 , 에러 처리 진행
//로그인 로그아웃 처리는

class UserController {
  UserController({
    required this.authRepository,
    required this.secureStorage,
    required this.userRepository,
  });
  final UserRepository userRepository;
  final AuthRepository authRepository;
  final FlutterSecureStorage secureStorage;

  Future<Either<String, bool>> signIn(
      {required String email, required String password}) async {
    try {
      var signInResponse = await authRepository.signIn(
        email: email,
        password: password,
      );

      return signInResponse.fold((l) {
        return left(l.message);
      }, (r) async {
        await secureStorage.write(key: accessTokenKey, value: r.accessToken);
        await secureStorage.write(key: refreshTokenKey, value: r.refreshToken);

        var getMeResponse = await userRepository.getRemoteUserInfo();
        getMeResponse.fold((l) {
          return left(l.message);
        }, (userInfo) async {
          await userRepository.saveUserInfo(userInfo);
          // 사용자 인증 상태를 로컬에 저장
          await authRepository.setAuthenticated(true);

          return right(true);
        });
        return left('로그인에 실패했습니다. 다시 시도해주세요.');
      });
    } catch (e) {
      throw Exception('$e.message, 로그인에 실패했습니다. 다시 시도해주세요.');
    }

    //로그인 실패
  }

  Future<void> signOut() async {
    try {
      // Secure Storage에서 Access Token과 Refresh Token 삭제
      await Future.wait([
        secureStorage.delete(key: accessTokenKey),
        secureStorage.delete(key: refreshTokenKey),
        userRepository.clearUserInfo(),
        authRepository.setAuthenticated(false),
      ]);
      // 사용자 정보 삭제
    } catch (e) {
      throw Exception('$e.message, 로그인에 실패했습니다. 다시 시도해주세요.');
    }
  }
}

@riverpod
UserController userController(UserControllerRef ref) {
  return UserController(
      authRepository: ref.read(authRepositoryProvider),
      secureStorage: ref.read(secureStorageProvider),
      userRepository: ref.read(userRepositoryProvider));
}
