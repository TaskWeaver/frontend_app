import 'package:front/features/login/models/user.dart';
import 'package:front/features/login/usecase/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_screen_viewmodel.g.dart';

@riverpod
class MainScreenViewModel extends _$MainScreenViewModel {
  @override
  AsyncValue<UserModel?> build() {
    return const AsyncValue.loading();
  }

  Future<void> getLocalUserInfo() async {
    var userInfo =
        await Future(() => ref.read(getLocalUserInfoUseCaseProvider).call());
    userInfo.fold(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) => state = AsyncValue.data(r),
    );
  }

  Future<void> getRemoteUserInfo() async {
    var userInfo =
        await Future(() => ref.read(getRemoteUserInfoUseCaseProvider).call());
    userInfo.fold(
      (l) {
        state = AsyncValue.error(l, StackTrace.current);
      },
      (r) => state = AsyncValue.data(r),
    );
  }

  void signOut() {
    ref.read(signOutUseCaseProvider).call();
    state = const AsyncValue.data(null);
  }
}
