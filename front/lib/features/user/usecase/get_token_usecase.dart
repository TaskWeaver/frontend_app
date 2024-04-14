import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class GetTokenUseCase {
  const GetTokenUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<TokenModel>> call() async {
    return _userRepository.getToken();
  }
}
