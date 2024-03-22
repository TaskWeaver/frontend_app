import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';

abstract class TeamRepository {
  Future<Result<List<TeamModel>>> getTeams();

  Future<Result<TeamModel>> createTeam(Map<String, dynamic> name);

  Future<Result<ApiResponse<TeamDetailModel>>> getTeamById(int teamId);

  Future<Result> inviteTeamByEmail(String id);

  Future<Result> deleteMember(
    int teamId,
    Map<String, dynamic> memberId,
  );

  Future<Result> invitationNotification();

  Future<Result> invitationResponse(int teamId, int inviteState);
}
