import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/login/entity/token.dart';
import 'package:front/features/login/repositories/user_repository.dart';

class GetTokenUseCase {
  GetTokenUseCase({required this.userRepository});
  final UserRepository userRepository;

  Future<Either<Failure, Token>> call() async {
    return await userRepository.getToken();
  }
}
