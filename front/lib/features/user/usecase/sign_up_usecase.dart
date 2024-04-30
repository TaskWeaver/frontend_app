import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/sign_up_request.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class SignUpUseCase {
  const SignUpUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<ApiResponse>> call(SignUpRequest signUpRequest) async {
    return _userRepository.signUp(signUpRequest);
  }
}
