import 'package:front/app/locator.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:front/features/user/presentation/state/user_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_info_page_viewmodel.g.dart';

@riverpod
class MyInfoViewModel extends _$MyInfoViewModel {
  @override
  UserState build() => const UserState.loading();

  Future<void> getUserInfo() async {
    final response = await getUserInfoUseCase.call();
    return response.fold(
        onSuccess: (value) => state = UserState<UserModel>(
              UserModel.fromJson(value.result),
            ),
        onFailure: (e) => state = UserState.error(message: e.toString()));
  }

  Future<void> changePassword(ChangePassword changePassword) async {
    final response = await changePasswordUseCase.call(changePassword);
    return response.fold(
        onSuccess: (value) => state = UserState(value.result),
        onFailure: (e) => state = UserState.error(message: e.toString()));
  }

  Future<void> getToken() async {
    final response = await getTokenUseCase.call();
    return response.fold(
        onSuccess: (value) => state = UserState<TokenModel>(value),
        onFailure: (e) => state = UserState.error(message: e.toString()));
  }
}
