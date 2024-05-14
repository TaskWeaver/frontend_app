import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/data/models/sign_up_response.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class SignUpUseCase {
  const SignUpUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, SignUpResponse>> call(
      SignUpRequest signUpRequest) async {
    return _userRepository.signUp(signUpRequest);
  }
}
