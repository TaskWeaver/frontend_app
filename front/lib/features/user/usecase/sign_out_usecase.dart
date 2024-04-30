import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class SignOutUseCase {
  const SignOutUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<ApiResponse>> call() async {
    return _userRepository.signOut();
  }
}