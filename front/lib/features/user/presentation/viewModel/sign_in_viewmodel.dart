import 'package:front/app/locator.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_viewmodel.g.dart';

@riverpod
class SignInViewModel extends _$SignInViewModel {
  @override
  AsyncValue build() => const AsyncValue.data(null);

  Future<void> signIn(SignInRequest signInRequest) async {
    state = const AsyncValue.loading();

    final response = await signInUseCase.call(signInRequest);

    response.fold(
        onSuccess: (value) {
          var signInResponse = SignInResponse.fromJson(value.result);
          state = AsyncValue.data(signInResponse);
        },
        onFailure: (e) => state = AsyncValue.error(e, StackTrace.current));
  }

  Future<void> saveToken(TokenModel token) async {
    final response = await saveTokenUseCase.call(token);
    return response.fold(
        onSuccess: (_) => state = const AsyncValue.data(null),
        onFailure: (e) => state = AsyncValue.error(e, StackTrace.current));
  }
}
