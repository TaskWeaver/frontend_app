import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/change_password_model.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class ChangePasswordUseCase {
  const ChangePasswordUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, void>> call(ChangePasswordModel changePassword) async {
    return _userRepository.changePassword(changePassword);
  }
}
