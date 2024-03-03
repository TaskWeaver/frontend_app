import 'package:front/core/user/models/user.dart';
import 'package:front/core/user/repositories/user_repository.dart';

class SaveUserInfoUseCase {
  SaveUserInfoUseCase({required this.userRepository});
  final UserRepository userRepository;

  Future<void> call(UserModel userInfo) async {
    await userRepository.saveUserInfo(userInfo);
  }
}
