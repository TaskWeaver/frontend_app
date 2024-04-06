import 'package:front/core/utils/result.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class AutoSignInCheckUseCase {
  const AutoSignInCheckUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<bool>> call() async {
    return _userRepository.autoSignInCheck();
  }
}