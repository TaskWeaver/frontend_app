import 'package:dartz/dartz.dart';
import 'package:front/core/user/models/user.dart';
import 'package:front/core/user/repositories/user_repository.dart';
import 'package:front/core/utils/failure.dart';

class GetRemoteUserInfoUseCase {
  GetRemoteUserInfoUseCase({required this.userRepository});
  final UserRepository userRepository;

  Future<Either<Failure, UserModel>> call() async {
    return await userRepository.getRemoteUserInfo();
  }
}
