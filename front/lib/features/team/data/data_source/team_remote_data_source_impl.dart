import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/features/team/data/api/team_api.dart';
import 'package:front/features/team/data/data_source/team_remote_data_source.dart';
import 'package:front/features/team/data/models/create_team_request.dart';
import 'package:front/features/team/data/models/create_team_response.dart';
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_model.dart';

final class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final TeamAPI _teamAPI = TeamAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  @override
  Future<ApiResponse<CreateTeamResponse>> createTeam(
      CreateTeamRequest createTeamRequest) {
    return _teamAPI.createTeam(createTeamRequest: createTeamRequest.toJson());
  }

  @override
  Future<ApiResponse> deleteMember(int teamId, Map<String, dynamic> memberId) {
    return _teamAPI.deleteTeamMember(teamId: teamId, memberId: memberId);
  }

  @override
  Future<ApiResponse<TeamDetailModel>> getTeamById(int teamId) {
    return _teamAPI.getTeamById(teamId: teamId);
  }

  @override
  Future<ApiResponse> invitationNotification() {
    return _teamAPI.invitationNotification();
  }

  @override
  Future<ApiResponse> answerToInvitation(InviteResponse inviteResponse) {
    return _teamAPI.answerToInvitation(inviteResponse);
  }

  @override
  Future<ApiResponse> inviteTeamByEmail(InviteTeam inviteTeam) {
    throw _teamAPI.inviteTeamByEmail(inviteTeam);
  }

  @override
  Future<ApiResponse<List<TeamModel>>> getTeams() {
    return _teamAPI.getTeams();
  }
}
