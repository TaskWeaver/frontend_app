import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/features/user/data/models/sign_in_response.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState<T> with _$SignInState<T> {
  const factory SignInState.pending() = SignInStatePending;
  const factory SignInState.loading() = SignInStateLoading;
  const factory SignInState.error({String? message}) = SignInStateError;
  const factory SignInState.success(T data) = SignInStateData;
  const factory SignInState.failed() = SignInStateFailed;
}
