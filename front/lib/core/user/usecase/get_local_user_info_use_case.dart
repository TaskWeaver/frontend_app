import 'package:dartz/dartz.dart';
import 'package:front/core/user/models/user.dart';
import 'package:front/core/user/repositories/user_repository.dart';
import 'package:front/core/utils/failure.dart';

class GetLocalUserInfoUseCase {
  GetLocalUserInfoUseCase({
    required this.userRepository,
  });
  final UserRepository userRepository;

  Future<Either<Failure, UserModel?>> call() {
    return userRepository.getLocalUserInfo();
  }
}
