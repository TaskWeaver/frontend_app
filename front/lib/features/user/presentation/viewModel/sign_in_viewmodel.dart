import 'package:front/app/locator.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/presentation/state/sign_in_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_viewmodel.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  @override
  SignInState build() => const SignInState.pending();

  Future<void> signIn(SignInRequest signInRequest) async {
    final response = await signInUseCase.call(signInRequest);
    return response.fold(
        onSuccess: (value) => state = SignInState<SignInResponse>.success(
            SignInResponse.fromJson(value.result)),
        onFailure: (e) => state = SignInState.error(message: e.toString()));
    // Todo : Exception Handling
    // 1. 아이디 & 비밀번호 불일치
    // 2. 서버 에러
    // 3. 네트워크 에러
    // 4. 기타 에러
  }

  Future<void> autoSignInCheck() async {
    final response = await autoSignInCheckUseCase.call();
    return response.fold(
        onSuccess: (value) => state = SignInState<bool>.success(value),
        onFailure: (e) => state = SignInState.error(message: e.toString()));
  }

  Future<void> setAutoSignInTrue() async {
    final response = await setAutoSignInTrueUseCase.call();
    return response.fold(
        onSuccess: (value) => state = SignInState.success(value),
        onFailure: (e) => state = SignInState.error(message: e.toString()));
  }

  Future<void> setAutoSignInFalse() async {
    final response = await setAutoSignInFalseUseCase.call();
    return response.fold(
        onSuccess: (value) => state = SignInState.success(value),
        onFailure: (e) => state = SignInState.error(message: e.toString()));
  }

  Future<void> saveToken(TokenModel token) async {
    final response = await saveTokenUseCase.call(token);
    return response.fold(
        onSuccess: (value) => state = SignInState.success(value),
        onFailure: (e) => state = SignInState.error(message: e.toString()));
  }
}
