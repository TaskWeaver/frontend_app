import 'package:front/features/login/repositories/rivorpod.dart';
import 'package:front/features/login/usecase/clear_token_use_case.dart';
import 'package:front/features/login/usecase/clear_user_info_use_case.dart';
import 'package:front/features/login/usecase/get_local_user_info_use_case.dart';
import 'package:front/features/login/usecase/get_remote_user_info_use_case.dart';
import 'package:front/features/login/usecase/get_token_use_case.dart';
import 'package:front/features/login/usecase/save_local_user_info_use_case.dart';
import 'package:front/features/login/usecase/save_token_use_case.dart';
import 'package:front/features/login/usecase/set_authenticated_use_case.dart';
import 'package:front/features/login/usecase/sign_in_by_email_use_case.dart';
import 'package:front/features/login/usecase/sign_out_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod.g.dart';

@riverpod
SignInByEmailUseCase signInByEmailUseCase(SignInByEmailUseCaseRef ref) {
  var signInByEmailUseCase = SignInByEmailUseCase(
    authRepository: ref.read(authRepositoryProvider),
    getRemoteUserInfoUseCase: ref.read(getRemoteUserInfoUseCaseProvider),
    setAuthenticatedUseCase: ref.read(setAuthenticatedUseCaseProvider),
    saveTokenUseCase: ref.read(saveTokenUseCaseProvider),
    getTokenUseCase: ref.read(getTokenUseCaseProvider),
    saveUserInfoUseCase: ref.read(saveUserInfoUseCaseProvider),
  );

  return signInByEmailUseCase;
}

@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  var signOutUseCase = SignOutUseCase(
    clearUserInfoUseCase: ref.read(clearUserInfoUseCaseProvider),
    clearTokenUseCase: ref.read(clearTokenUseCaseProvider),
    setAuthenticatedUseCase: ref.read(setAuthenticatedUseCaseProvider),
  );

  return signOutUseCase;
}

@riverpod
SetAuthenticatedUseCase setAuthenticatedUseCase(
    SetAuthenticatedUseCaseRef ref) {
  var setAuthenticatedUseCase =
      SetAuthenticatedUseCase(authRepository: ref.read(authRepositoryProvider));

  return setAuthenticatedUseCase;
}

@riverpod
GetTokenUseCase getTokenUseCase(GetTokenUseCaseRef ref) {
  var getTokenUseCase =
      GetTokenUseCase(userRepository: ref.read(userRepositoryProvider));

  return getTokenUseCase;
}

@riverpod
SaveTokenUseCase saveTokenUseCase(SaveTokenUseCaseRef ref) {
  var saveTokenUseCase =
      SaveTokenUseCase(userRepository: ref.read(userRepositoryProvider));

  return saveTokenUseCase;
}

@riverpod
SaveUserInfoUseCase saveUserInfoUseCase(SaveUserInfoUseCaseRef ref) {
  var saveUserInfoUseCase =
      SaveUserInfoUseCase(userRepository: ref.read(userRepositoryProvider));

  return saveUserInfoUseCase;
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

@riverpod
ClearUserInfoUseCase clearUserInfoUseCase(ClearUserInfoUseCaseRef ref) {
  var clearUserInfoUseCase =
      ClearUserInfoUseCase(userRepository: ref.read(userRepositoryProvider));
  return clearUserInfoUseCase;
}

@riverpod
ClearTokenUseCase clearTokenUseCase(ClearTokenUseCaseRef ref) {
  var clearTokenUseCase =
      ClearTokenUseCase(userRepository: ref.read(userRepositoryProvider));
  return clearTokenUseCase;
}
