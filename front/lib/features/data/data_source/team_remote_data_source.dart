import 'package:front/features/data/models/invite_response.dart';
import 'package:front/features/data/models/invite_team.dart';
import 'package:front/features/data/models/team.dart';
import 'package:front/features/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';

abstract class TeamRemoteDataSource {
  Future<ApiResponse<List<TeamModel>>> getTeams();

  Future<ApiResponse<TeamDetailModel>> getTeamById(int teamId);

  Future<ApiResponse<TeamModel>> createTeam(Map<String, dynamic> name);

  Future<ApiResponse> inviteTeamByEmail(InviteTeam inviteTeam);

  Future<ApiResponse> deleteMember(
    int teamId,
    Map<String, dynamic> memberId,
  );

  Future<ApiResponse> invitationNotification();

  Future<ApiResponse> answerToInvitation(InviteResponse inviteResponse);
}
