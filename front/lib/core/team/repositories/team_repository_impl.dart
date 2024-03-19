import 'package:front/core/team/data/data_source/team_remote_data_source.dart';
import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/domain/entities/team_entity.dart';
import 'package:front/core/team/repositories/team_repository.dart';
import 'package:front/core/utils/result.dart';

class TeamRepositoryImpl implements TeamRepository {
  const TeamRepositoryImpl({
    required TeamRemoteDataSource teamRemoteDataSource,
  }) : _teamRemoteDataSource = teamRemoteDataSource;

  final TeamRemoteDataSource _teamRemoteDataSource;

  @override
  Future<Result<TeamModel>> createTeam(Map<String, dynamic> name) async {
    try {
      // final result = await _teamRemoteDataSource.createTeam(name);
      var value = await _teamRemoteDataSource.createTeam(name);
      // return Result.success(UserDataEntity.fromDto(userDto));

      // print('impl result: $result');
      // return Result.success(result);
      return Result.success(value);
      // return Result.success(TeamModel.fromModel(result));
    } on Exception catch (e) {
      return Result.error(e);
    }
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

  @override
  Future<Result<TeamModel>> getTeamById(int teamId) async {
    throw UnimplementedError();
  }

  // @override
  // Future<Result> checkInviteLink() {
  //   // TODO: implement checkInviteLink
  //   throw UnimplementedError();
  // }

  @override
  Future<Result> deleteMember(int teamId) {
    // TODO: implement deleteMember
    throw UnimplementedError();
  }



  @override
  Future<Result> invitationNotification() {
    // TODO: implement invitationNotification
    throw UnimplementedError();
  }

  @override
  Future<Result> invitationResponse(int teamId, int inviteState) {
    // TODO: implement invitationResponse
    throw UnimplementedError();
  }

  @override
  Future<Result> inviteTeamByEmail(String id) {
    // TODO: implement inviteTeamById
    throw UnimplementedError();
  }
}
