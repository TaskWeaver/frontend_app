import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:front/features/user/repositories/user_repositories.dart';

final class GetUserInfoUseCase {
  const GetUserInfoUseCase(this._userRepository);
  final UserRepository _userRepository;

  Future<Result<ApiResponse<UserModel>>> call() async {
    return _userRepository.getUserInfo();
  }
}
