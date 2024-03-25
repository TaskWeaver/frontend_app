import 'package:front/core/user/usecase/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginScreenViewModel extends _$LoginScreenViewModel {
  @override
  AsyncValue<dynamic> build() => const AsyncValue.loading();

  Future<bool?> signInByEmail(String email, String password) async {
    var result =
        await ref.read(signInByEmailUseCaseProvider).call(email, password);

    result.fold((l) {
      state = AsyncValue.error(l, StackTrace.current);
      return false;
    }, (r) {
      state = AsyncValue.data(r);
      return true;
    });
    return null;
  }
}
