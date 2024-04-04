import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/change_password.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class ChangePasswordUseCase {
  const ChangePasswordUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<ApiResponse>> call(ChangePassword changePassword) async {
    return _userRepository.changePassword(changePassword);
  }
}
