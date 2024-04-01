import 'package:dartz/dartz.dart';

import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/repositories/user_repository.dart';

class ClearTokenUseCase {
  ClearTokenUseCase({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<Failure, bool>> call() async {
    return userRepository.clearToken();
  }
}
