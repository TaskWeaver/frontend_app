import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/sign_in_request.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class SignInUseCase {
  const SignInUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<ApiResponse>> call(SignInRequest signInRequest) async {
    return _userRepository.signIn(signInRequest);
  }
}
