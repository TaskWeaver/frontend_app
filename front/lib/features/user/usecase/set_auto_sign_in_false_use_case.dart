import 'package:front/core/utils/result.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class SetAutoSignInFalseUseCase {
  const SetAutoSignInFalseUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result> call() async {
    return _userRepository.setAutoSignInFalse();
  }
}
