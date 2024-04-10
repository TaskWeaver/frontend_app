import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/features/team/data/api/team_api.dart';
import 'package:front/features/team/data/models/change_teamLeader.dart';
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/data/models/team.dart';
import 'package:front/features/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';

import 'team_remote_data_source.dart';

final class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final TeamAPI _teamAPI = TeamAPI(
    AppDio.instance,
    baseUrl:
        'v1/',
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
    return _teamAPI.inviteTeamByEmail(inviteTeam);
  }

  @override
  Future<ApiResponse<List<TeamModel>>> getTeams() {
    return _teamAPI.getTeams();
  }

  @override
  Future<ApiResponse> changeTeamLeader(ChangeTeamLeaderModel changeTeamLeaderModel) {
    return _teamAPI.changeTeamLeader(changeTeamLeaderModel);
  }

}
