import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/user_model.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class GetUserInfoUseCase {
  const GetUserInfoUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, UserModel>> call() async {
    return _userRepository.getUserInfo();
  }
}
