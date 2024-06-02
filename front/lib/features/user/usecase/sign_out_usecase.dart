import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class SignOutUseCase {
  const SignOutUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, void>> call() async {
    return _userRepository.signOut();
  }
}
