import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState<T> with _$UserState<T> {
  const factory UserState.loading() = _UserStateLoading;
  const factory UserState.error({String? message}) = _UserStateError;
  const factory UserState(T t) = _UserStateData;
}
