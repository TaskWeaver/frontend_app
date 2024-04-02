import 'package:dartz/dartz.dart';

import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/models/user.dart';
import 'package:front/features/user/repositories/user_repository.dart';

class GetLocalUserInfoUseCase {
  GetLocalUserInfoUseCase({
    required this.userRepository,
  });
  final UserRepository userRepository;

  Future<Either<Failure, UserModel?>> call() {
    return userRepository.getLocalUserInfo();
  }
}
