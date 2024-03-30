import 'package:front/features/login/repositories/auth_repository.dart';

class SetAuthenticatedUseCase {
  SetAuthenticatedUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<void> call(bool value) async {
    await authRepository.setAuthenticated(value);
  }
}
