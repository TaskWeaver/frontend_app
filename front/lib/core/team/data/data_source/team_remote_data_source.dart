import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/domain/entities/team_entity.dart';

abstract class TeamRemoteDataSource {
  // Future<List<TeamEntity>> getTeams();

  Future<TeamModel> createTeam(Map<String, dynamic> name);

  Future<TeamModel> getTeamById(int teamId);

  Future inviteTeamByEmail(String id);

  // Future checkInviteLink();

  Future deleteMember(int teamId); //
  // 팀장 권한 넘기기
  Future invitationNotification();

  Future invitationResponse(int teamId, int inviteState);
}
