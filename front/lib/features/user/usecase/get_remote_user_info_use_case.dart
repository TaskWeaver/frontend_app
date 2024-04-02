import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/models/user.dart';
import 'package:front/features/user/repositories/user_repository.dart';

class GetRemoteUserInfoUseCase {
  GetRemoteUserInfoUseCase({required this.userRepository});
  final UserRepository userRepository;

  Future<Either<Failure, UserModel>> call() async {
    return await userRepository.getRemoteUserInfo();
  }
}