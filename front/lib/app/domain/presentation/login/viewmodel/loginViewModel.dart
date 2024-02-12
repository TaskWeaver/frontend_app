import 'package:front/core/Auth/models/user.dart';
import 'package:front/core/Auth/user_login_state_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loginViewModel.g.dart';

@riverpod
Future<UserModel> loginScreenViewModel(
    LoginScreenViewModelRef ref, String email, String password) async {
  // async 키워드 추가
  try {
    // await를 사용하여 비동기 호출 처리
    var userModel = await ref
        .read(userLoginStateProvider.notifier)
        .signIn(email: email, password: password);

    return userModel;
  } catch (e) {
    throw Exception('loginScreenViewModel error');
  }
}
