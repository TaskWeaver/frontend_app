import 'package:dartz/dartz.dart';
import 'package:front/core/user/entity/token.dart';
import 'package:front/core/user/repositories/auth_repository.dart';
import 'package:front/core/user/usecase/get_remote_user_info_use_case.dart';
import 'package:front/core/user/usecase/get_token_use_case.dart';
import 'package:front/core/user/usecase/save_local_user_info_use_case.dart';
import 'package:front/core/user/usecase/save_token_use_case.dart';
import 'package:front/core/user/usecase/set_authenticated_use_case.dart';

class SignInByEmailUseCase {
  const SignInByEmailUseCase({
    required this.authRepository,
    required this.getRemoteUserInfoUseCase,
    required this.setAuthenticatedUseCase,
    required this.saveTokenUseCase,
    required this.getTokenUseCase,
    required this.saveUserInfoUseCase,
  });
  final AuthRepository authRepository;
  final GetRemoteUserInfoUseCase getRemoteUserInfoUseCase;
  final SetAuthenticatedUseCase setAuthenticatedUseCase;
  final SaveTokenUseCase saveTokenUseCase;
  final GetTokenUseCase getTokenUseCase;
  final SaveUserInfoUseCase saveUserInfoUseCase;
  Future<Either<String, bool>> call(String email, String password) async {
    var loginResponse =
        await authRepository.signIn(email: email, password: password);
    return loginResponse.fold((l) {
      return left(l.message);
    }, (r) async {
      var token =
          Token(accessToken: r.accessToken, refreshToken: r.refreshToken);

      print('accessToken = ${r.accessToken}');

      await saveTokenUseCase.call(token);
      var getMeResponse = await getRemoteUserInfoUseCase.call();
      return getMeResponse.fold((l) {
        return left(l.message);
      }, (r) async {
        await saveUserInfoUseCase.call(r);
        await setAuthenticatedUseCase.call(true);
        return right(true);
      });
    });
  }
}
