import 'package:front/app/locator.dart';
import 'package:front/features/user/data/models/change_password_model.dart';
import 'package:front/features/user/data/models/token_model.dart';
import 'package:front/features/user/data/models/user_model.dart';
import 'package:front/features/user/presentation/state/user_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_info_page_viewmodel.g.dart';

@riverpod
class MyInfoViewModel extends _$MyInfoViewModel {
  @override
  UserState build() => const UserState.loading();

  Future<void> getUserInfo() async {
    final response = await getUserInfoUseCase.call();
    return response.fold((l) => state = UserState.error(message: l.toString()),
        (r) => state = UserState<UserModel>(r));
  }

  Future<void> changePassword(ChangePasswordModel changePassword) async {
    final response = await changePasswordUseCase.call(changePassword);
    return response.fold((l) => state = UserState.error(message: l.toString()),
        (r) => state = UserState<void>(r));
  }

  Future<void> getToken() async {
    final response = await getTokenUseCase.call();
    return response.fold((l) => state = UserState.error(message: l.toString()),
        (r) => state = UserState<TokenModel>(r));
  }
}
