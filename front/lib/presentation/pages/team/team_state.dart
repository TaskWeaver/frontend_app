import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_state.freezed.dart';

@freezed
class TeamState<T> with _$TeamState<T> {
  const factory TeamState.loading() = _TeamStateStateLoading;

  const factory TeamState.error({String? message}) = _TeamStateError;

  const factory TeamState(T t) = _TeamStateData;
}
