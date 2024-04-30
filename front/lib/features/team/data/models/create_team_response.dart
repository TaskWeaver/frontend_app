import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_team_response.freezed.dart';
part 'create_team_response.g.dart';

@freezed
class CreateTeamResponse with _$CreateTeamResponse {
  factory CreateTeamResponse({
    required int id,
    required String name,
    required String inviteLink,
    int? teamLeader,
    required String createdAt,
  }) = _CreateTeamResponse;

  factory CreateTeamResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTeamResponseFromJson(json);

  factory CreateTeamResponse.fromModel(CreateTeamResponse team) {
    return CreateTeamResponse(
      id: team.id,
      name: team.name,
      inviteLink: team.inviteLink,
      teamLeader: team.teamLeader,
      createdAt: team.createdAt,
    );
  }
}
