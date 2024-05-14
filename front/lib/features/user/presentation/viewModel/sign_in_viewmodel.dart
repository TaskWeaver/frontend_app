import 'package:flutter/foundation.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
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

    response.fold((l) {
      debugPrint(l.toString());
      state = AsyncValue.error(l, StackTrace.current);
    }, (r) => state = AsyncValue.data(r));
  }

  Future<void> saveToken(TokenModel token) async {
    final response = await saveTokenUseCase.call(token);
    return response.fold((l) => state = AsyncValue.error(l, StackTrace.current),
        (r) => state = const AsyncValue.data(null));
  }
}
