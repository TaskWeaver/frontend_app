import 'package:front/core/config/providers/dio.dart';
import 'package:front/core/network_handling/app_dio.dart';
import 'package:front/core/team/data/api/team_api.dart';
import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/domain/entities/team_entity.dart';
// part 'team_remote_data_source_impl.g.dart';

final class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  // TeamRemoteDataSourceImpl({required TeamAPI teamAPI}) : _teamAPI = teamAPI;
  // final TeamAPI _teamAPI;

  // TeamRemoteDataSourceImpl({required this.dio});
  final TeamAPI _teamAPI = TeamAPI(
    AppDio.instance,
    baseUrl:
        'http://ec2-3-34-95-39.ap-northeast-2.compute.amazonaws.com:8083/v1',
  );

  // @override
  // Future checkInviteLink() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<TeamEntity>> getTeams() async {
  //   return _teamAPI.getTeams();
  // }

  @override
  Future<TeamModel> createTeam(Map<String, dynamic> name) {
    return _teamAPI.createTeam(name: name);
  }

  @override
  Future deleteMember(int teamId) {
    // TODO: implement deleteMember
    throw UnimplementedError();
  }

  @override
  Future<TeamModel> getTeamById(int teamId) {
    throw UnimplementedError();
  }

  @override
  Future invitationNotification() {
    // TODO: implement invitationNotification
    throw UnimplementedError();
  }

  @override
  Future invitationResponse(int teamId, int inviteState) {
    // TODO: implement invitationResponse
    throw UnimplementedError();
  }

  @override
  Future inviteTeamByEmail(String id) {
    // TODO: implement inviteTeamById
    throw UnimplementedError();
  }
}

// @riverpod
// TeamRemoteDataSource teamRemoteDataSource(TeamRemoteDataSourceRef ref) {
//   final dio = ref.watch(dioProvider);
//   return TeamRemoteDataSourceImpl(teamAPI: dio);
// }
