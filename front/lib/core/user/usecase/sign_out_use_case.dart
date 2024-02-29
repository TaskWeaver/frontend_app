import 'package:front/core/user/provider/user_controller.dart';

class SignOutUseCase {
  const SignOutUseCase(this.userLoginStateController);
  final UserController userLoginStateController;

  Future<void> call() {
    return userLoginStateController.signOut();
  }
}
