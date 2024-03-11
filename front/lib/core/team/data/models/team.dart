import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/team/domain/entities/team.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class TeamModel with _$TeamModel {
  factory TeamModel({
    required String teamId,
    required String name,
    required String inviteLink,
    required String teamLeader,
    required String createdAt,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  factory TeamModel.fromEntity(Team team) {
    return TeamModel(
      teamId: team.teamId,
      name: team.name,
      inviteLink: team.inviteLink,
      teamLeader: team.teamLeader,
      createdAt: team.createdAt,
    );
  }

  TeamModel._();

  Team toEntity() {
    return Team(
      teamId: teamId,
      name: name,
      inviteLink: inviteLink,
      teamLeader: teamLeader,
      createdAt: createdAt,
    );
  }
}
