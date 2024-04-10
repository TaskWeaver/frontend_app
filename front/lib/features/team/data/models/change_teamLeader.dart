import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_teamLeader.g.dart';

@JsonSerializable()
class ChangeTeamLeaderModel {
  final int teamId;
  final int inviteState;

  ChangeTeamLeaderModel({
    required this.teamId,
    required this.inviteState,
  });

  Map<String, dynamic> toJson() => _$ChangeTeamLeaderModelToJson(this);
}
