import 'package:front/core/user/provider/user_controller.dart';
import 'package:front/core/user/repositories/rivorpod.dart';
import 'package:front/core/user/usecase/get_local_user_info_use_case.dart';
import 'package:front/core/user/usecase/get_remote_user_info_use_case.dart';
import 'package:front/core/user/usecase/sign_in_by_email_use_case.dart';
import 'package:front/core/user/usecase/sign_out_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
SignInByEmailUseCase signInByEmailUseCase(SignInByEmailUseCaseRef ref) {
  var signInByEmailUseCase =
      SignInByEmailUseCase(ref.read(userControllerProvider));

  return signInByEmailUseCase;
}

@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  var signOutUseCase = SignOutUseCase(ref.read(userControllerProvider));

  return signOutUseCase;
}

@riverpod
GetLocalUserInfoUseCase getLocalUserInfoUseCase(
    GetLocalUserInfoUseCaseRef ref) {
  var getLocalUserInfoUseCase =
      GetLocalUserInfoUseCase(userRepository: ref.read(userRepositoryProvider));
  return getLocalUserInfoUseCase;
}

@riverpod
GetRemoteUserInfoUseCase getRemoteUserInfoUseCase(
    GetRemoteUserInfoUseCaseRef ref) {
  var getRemoteUserInfoUseCase = GetRemoteUserInfoUseCase(
      userRepository: ref.read(userRepositoryProvider));
  return getRemoteUserInfoUseCase;
}
