import 'package:front/features/team/data/data_source/team_remote_data_source.dart';
import 'package:front/features/team/data/models/change_teamLeader.dart';
import 'package:front/features/team/data/models/invite_response.dart';
import 'package:front/features/team/data/models/invite_team.dart';
import 'package:front/features/team/data/models/team.dart';
import 'package:front/features/team/data/models/team_detail.dart';
import 'package:front/core/utils/api_response.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/team/repositories/team_repository.dart';

class TeamRepositoryImpl implements TeamRepository {
  const TeamRepositoryImpl({
    required TeamRemoteDataSource teamRemoteDataSource,
  }) : _teamRemoteDataSource = teamRemoteDataSource;

  final TeamRemoteDataSource _teamRemoteDataSource;

  @override
  Future<Result<ApiResponse<TeamModel>>> createTeam(String name) async {
    try {
      final result = await _teamRemoteDataSource.createTeam({
        'name': name,
      });

      return Result.success(result);
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
  Future<Result<ApiResponse>> deleteMember({
    required int teamId,
    // required Map<String, dynamic> memberId,
    required List<int> memberId,
  }) async {
    try {
      final result = await _teamRemoteDataSource.deleteMember(
        teamId,
        {'memberId': memberId},
      );
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> invitationNotification() async {
    try {
      final result = await _teamRemoteDataSource.invitationNotification();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> answerToInvitation(
      InviteResponse inviteResponse) async {
    try {
      final result =
          await _teamRemoteDataSource.answerToInvitation(inviteResponse);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> inviteTeamByEmail(InviteTeam inviteTeam) async {
    try {
      final result = await _teamRemoteDataSource.inviteTeamByEmail(inviteTeam);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse<List<TeamModel>>>> getTeams() async {
    try {
      final result = await _teamRemoteDataSource.getTeams();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<ApiResponse>> changeTeamLeader(ChangeTeamLeaderModel changeTeamLeaderModel) async{
    try {
      final result = await _teamRemoteDataSource.changeTeamLeader(changeTeamLeaderModel);
      return Result.success(result);
    } on Exception catch(e) {
      return Result.failure(e);
    }
  }
}
