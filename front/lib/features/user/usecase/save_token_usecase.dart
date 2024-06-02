import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/token_model.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class SaveTokenUseCase {
  SaveTokenUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, void>> call(TokenModel tokenModel) async {
    return _userRepository.saveToken(tokenModel);
  }
}
