import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/data/models/create_team_request.dart';
import 'package:front/features/team/data/models/create_team_response.dart';
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_member.dart';
import 'package:front/features/team/data/models/team_model.dart';

abstract class TeamRepository {
  Future<Result<ApiResponse<List<TeamModel>>>> getTeams();

  Future<Result<ApiResponse<CreateTeamResponse>>> createTeam(
    CreateTeamRequest createTeamRequest,
  );

  Future<Result<ApiResponse<TeamDetailModel>>> getTeamById(int teamId);

  Future<Result<ApiResponse>> inviteTeamByEmail(InviteTeam inviteTeam);

  Future<Result<ApiResponse>> deleteMember({
    required int teamId,
    required List<int> memberId,
  });

  Future<Result<List<TeamMemberModel>>> getTeamMembersByTeamId(int teamId);

  Future<Result<ApiResponse>> invitationNotification();

  Future<Result<ApiResponse>> answerToInvitation(InviteResponse inviteResponse);
}
