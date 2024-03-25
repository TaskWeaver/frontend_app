import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/features/data/api/team_api.dart';
import 'package:front/features/data/models/invite_response.dart';
import 'package:front/features/data/models/invite_team.dart';
import 'package:front/features/data/models/team.dart';
import 'package:front/features/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';

import 'team_remote_data_source.dart';

final class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final TeamAPI _teamAPI = TeamAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  @override
  Future<ApiResponse<TeamModel>> createTeam(Map<String, dynamic> name) {
    return _teamAPI.createTeam(name: name);
  }

  @override
  Future<ApiResponse> deleteMember(
      int teamId, Map<String, dynamic> memberId) {
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
