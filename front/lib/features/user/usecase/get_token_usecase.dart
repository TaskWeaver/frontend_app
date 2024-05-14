import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/token.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class GetTokenUseCase {
  const GetTokenUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, TokenModel>> call() async {
    return _userRepository.getToken();
  }
}
