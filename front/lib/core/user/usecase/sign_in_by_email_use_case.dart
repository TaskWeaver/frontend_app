import 'package:dartz/dartz.dart';
import 'package:front/core/user/provider/user_controller.dart';

class SignInByEmailUseCase {
  const SignInByEmailUseCase(this.userLoginStateController);
  final UserController userLoginStateController;

  Future<Either<String, bool>> call(String email, String password) {
    return userLoginStateController.signIn(email: email, password: password);
  }
}
