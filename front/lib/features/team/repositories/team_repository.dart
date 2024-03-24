import 'package:front/core/team/data/models/invite_response.dart';
import 'package:front/core/team/data/models/invite_team.dart';
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';

abstract class TeamRepository {
  Future<Result<ApiResponse<List<TeamModel>>>> getTeams();

  Future<Result<ApiResponse<TeamModel>>> createTeam(String name);

  Future<Result<ApiResponse<TeamDetailModel>>> getTeamById(int teamId);

  Future<Result<ApiResponse>> inviteTeamByEmail(InviteTeam inviteTeam);

  Future<Result<ApiResponse>> deleteMember({
    required int teamId,
    // required Map<String, dynamic> memberId,
    required List<int> memberId,
  });

  Future<Result<ApiResponse>> invitationNotification();

  Future<Result<ApiResponse>> answerToInvitation(InviteResponse inviteResponse);
}
