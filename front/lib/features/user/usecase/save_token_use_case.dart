import 'package:dartz/dartz.dart';

import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/entity/token.dart';
import 'package:front/features/user/repositories/user_repository.dart';

class SaveTokenUseCase {
  SaveTokenUseCase({required this.userRepository});
  final UserRepository userRepository;

  Future<Either<Failure, Token>> call(Token token) async {
    return await userRepository.saveToken(token);
  }
}
