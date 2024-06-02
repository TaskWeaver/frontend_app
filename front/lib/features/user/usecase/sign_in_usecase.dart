import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/user/data/models/sign_in_request_model.dart';
import 'package:front/features/user/data/models/sign_in_response_model.dart';
import 'package:front/features/user/repositories/user_repository.dart';

final class SignInUseCase {
  const SignInUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Either<Failure, SignInResponseModel>> call(
      SignInRequestModel signInRequest) async {
    return _userRepository.signIn(signInRequest);
  }
}
