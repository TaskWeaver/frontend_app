import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/core/team/data/api/team_api.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';

final class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final TeamAPI _teamAPI = TeamAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  @override
  Future<TeamModel> createTeam(Map<String, dynamic> name) {
    return _teamAPI.createTeam(name: name);
  }

  @override
  Future<TeamModel> deleteMember(int teamId, Map<String, dynamic> memberId) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<TeamDetailModel>> getTeamById(int teamId) {
    return _teamAPI.getTeamById(teamId: teamId);
  }

  @override
  Future invitationNotification() {
    throw UnimplementedError();
  }

  @override
  Future invitationAnswer(int teamId, int inviteState) {
    throw UnimplementedError();
  }

  @override
  Future inviteTeamByEmail(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<TeamModel>> getTeams() {
    throw UnimplementedError();
  }
}

// @riverpod
// TeamRemoteDataSource teamRemoteDataSource(TeamRemoteDataSourceRef ref) {
//   final dio = ref.watch(dioProvider);
//   return TeamRemoteDataSourceImpl(teamAPI: dio);
// }
