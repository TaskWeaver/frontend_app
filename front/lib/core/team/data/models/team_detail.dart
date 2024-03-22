import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/core/team/data/models/team_member.dart';

part 'team_detail.g.dart';

part 'team_detail.freezed.dart';

@freezed
class TeamDetailModel with _$TeamDetailModel {
  factory TeamDetailModel({
    required int id,
    required String name,
    required String inviteLink,
    String? teamLeader,
    required String createdAt,
    required int memberCount,
    List<TeamMemberModel>? teamMembers,
  }) = _TeamDetailModel;

  factory TeamDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TeamDetailModelFromJson(json);

  factory TeamDetailModel.fromModel(TeamDetailModel team) {
    return TeamDetailModel(
        id: team.id,
        name: team.name,
        inviteLink: team.inviteLink,
        teamLeader: team.teamLeader,
        createdAt: team.createdAt,
        memberCount: team.memberCount,
        teamMembers: team.teamMembers);
  }
}
