import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/data/models/team_detail.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';

class TeamRepositoryImpl implements TeamRepository {
  const TeamRepositoryImpl({
    required TeamRemoteDataSource teamRemoteDataSource,
  }) : _teamRemoteDataSource = teamRemoteDataSource;

  final TeamRemoteDataSource _teamRemoteDataSource;

  @override
  Future<Result<TeamModel>> createTeam(Map<String, dynamic> name) async {
    try {
      final result = await _teamRemoteDataSource.createTeam(name);
      print('impl result: $result');
      return Result.success(TeamModel.fromModel(result));
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<TeamDetailModel>>> getTeamById(int teamId) async {
    try {
      final result = await _teamRemoteDataSource.getTeamById(teamId);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result> deleteMember(
    int teamId,
    Map<String, dynamic> memberId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Result> invitationNotification() {
    throw UnimplementedError();
  }

  @override
  Future<Result> invitationResponse(int teamId, int inviteState) {
    throw UnimplementedError();
  }

  @override
  Future<Result> inviteTeamByEmail(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<TeamModel>>> getTeams() {
    throw UnimplementedError();
  }

// @override
// Future<Result<List<TeamEntity>>> getTeams() async {
//   try {
//     var result = await _teamRemoteDataSource.getTeams();
//     return Result.success(result);
//   } on Exception catch (e) {
//     return Result.error(e);
//   }
// }
}
