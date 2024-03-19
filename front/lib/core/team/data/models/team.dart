import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/team/domain/entities/team_entity.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class TeamModel with _$TeamModel {
  factory TeamModel({
    required String id,
    required String name,
    required String inviteLink,
    required String teamLeader,
    required String createdAt,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);

  // factory TeamModel.fromModel(TeamModel team) {
  //   return TeamModel(
  //     id: team.id,
  //     name: team.name,
  //     inviteLink: team.inviteLink,
  //     teamLeader: team.teamLeader,
  //     createdAt: team.createdAt,
  //   );
  // }

  // TeamModel._();

  // TeamEntity toEntity() {
  //   return TeamEntity(
  //     teamId: id,
  //     name: name,
  //     inviteLink: inviteLink,
  //     teamLeader: teamLeader,
  //     createdAt: createdAt,
  //   );
  // }
}
