import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/Auth/models/user.dart';

part 'auth_state.freezed.dart';

///AuthState는 로그인 상태를 정의하는 클래스입니다.
@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.error({String? message}) = _AuthStateError;
  const factory AuthState(UserModel userModel) = _AuthStateData;
  const factory AuthState.loggedOut() = _AuthStateLoggedOut;
}
