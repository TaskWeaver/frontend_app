import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class SaveTokenUseCase {
  SaveTokenUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result> call(TokenModel token) async {
    return _userRepository.saveToken(token);
  }
}
