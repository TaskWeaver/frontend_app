import 'package:dartz/dartz.dart';
import 'package:front/core/user/entity/token.dart';
import 'package:front/core/user/repositories/user_repository.dart';
import 'package:front/core/utils/failure.dart';

class SaveTokenUseCase {
  SaveTokenUseCase({required this.userRepository});
  final UserRepository userRepository;

  Future<Either<Failure, Token>> call(Token token) async {
    return await userRepository.saveToken(token);
  }
}
