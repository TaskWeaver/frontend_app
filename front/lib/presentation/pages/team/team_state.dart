import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';

part 'team_state.freezed.dart';

@freezed
class TeamState with _$TeamState {
  const factory TeamState.loading() = _TeamStateStateLoading;

  const factory TeamState.error({String? message}) = _TeamStateError;

  const factory TeamState(TeamDetailModel teamModel) = _TeamStateData;
}
