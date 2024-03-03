import 'package:dartz/dartz.dart';
import 'package:front/core/user/repositories/user_repository.dart';
import 'package:front/core/utils/failure.dart';

class ClearUserInfoUseCase {
  ClearUserInfoUseCase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<Failure, bool>> call() async {
    return userRepository.clearUserInfo();
  }
}
