import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';

abstract class TeamRemoteDataSource {
  Future<List<TeamModel>> getTeams();

  Future<ApiResponse<TeamDetailModel>> getTeamById(int teamId);

  Future<TeamModel> createTeam(Map<String, dynamic> name);

  Future inviteTeamByEmail(String id);

  Future<TeamModel> deleteMember(
    int teamId,
    Map<String, dynamic> memberId,
  );

  Future invitationNotification();

  Future invitationAnswer(int teamId, int inviteState);
}
