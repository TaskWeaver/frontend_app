import 'package:front/core/utils/api_response.dart';
import 'package:front/features/team/data/models/create_team_request.dart';
import 'package:front/features/team/data/models/create_team_response.dart';
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_model.dart';

abstract class TeamRemoteDataSource {
  Future<ApiResponse<List<TeamModel>>> getTeams();

  Future<ApiResponse<TeamDetailModel>> getTeamById(int teamId);

  Future<ApiResponse<CreateTeamResponse>> createTeam(
      CreateTeamRequest createTeamRequest);

  Future<ApiResponse> inviteTeamByEmail(InviteTeam inviteTeam);

  Future<ApiResponse> deleteMember(
    int teamId,
    Map<String, dynamic> memberId,
  );

  Future<ApiResponse> invitationNotification();

  Future<ApiResponse> answerToInvitation(InviteResponse inviteResponse);
}
