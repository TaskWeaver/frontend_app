import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/login/repositories/user_repository.dart';

class ClearUserInfoUseCase {
  ClearUserInfoUseCase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<Failure, bool>> call() async {
    return userRepository.clearUserInfo();
  }
}
