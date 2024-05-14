import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class SignInUseCase {
  const SignInUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, SignInResponse>> call(
      SignInRequest signInRequest) async {
    return _userRepository.signIn(signInRequest);
  }
}
