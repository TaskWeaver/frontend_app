import 'package:front/features/user/usecase/clear_token_use_case.dart';
import 'package:front/features/user/usecase/clear_user_info_use_case.dart';
import 'package:front/features/user/usecase/set_authenticated_use_case.dart';

class SignOutUseCase {
  const SignOutUseCase(
      {required this.clearUserInfoUseCase,
      required this.clearTokenUseCase,
      required this.setAuthenticatedUseCase});
  final ClearUserInfoUseCase clearUserInfoUseCase;
  final ClearTokenUseCase clearTokenUseCase;
  final SetAuthenticatedUseCase setAuthenticatedUseCase;

  Future<void> call() async {
    try {
      await clearTokenUseCase.call();
      await clearUserInfoUseCase.call();
      await setAuthenticatedUseCase.call(false);
    } catch (e) {
      throw 'Error signing out. Please try again.';
    }
  }
}
