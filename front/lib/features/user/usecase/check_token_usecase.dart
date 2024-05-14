import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class CheckTokenUseCase {
  const CheckTokenUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, bool>> call() async {
    return _userRepository.checkToken();
  }
}
// Future<Either<Failure, void>> call(ChangePassword changePassword) async {
//     return _userRepository.changePassword(changePassword);
//   }