import 'package:dartz/dartz.dart';
import 'package:front/core/config/custom_interceptor.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/data/data_source/team_remote_data_source.dart';
import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/data/models/create_team_response_model.dart';
import 'package:front/features/team/data/models/invite_response_model.dart';
import 'package:front/features/team/data/models/invite_team_model.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_member_model.dart';
import 'package:front/features/team/data/models/team_model.dart';
import 'package:front/features/team/repositories/team_repository.dart';

class TeamRepositoryImpl with ErrorHandler implements TeamRepository {
  const TeamRepositoryImpl({
    required TeamRemoteDataSource teamRemoteDataSource,
  }) : _teamRemoteDataSource = teamRemoteDataSource;

  final TeamRemoteDataSource _teamRemoteDataSource;

  @override
  Future<Either<Failure, void>> answerToInvitation(
      InviteResponse inviteResponse) {
    return catchError(() async {
      await _teamRemoteDataSource.answerToInvitation(inviteResponse);
    });
  }

  @override
  Future<Either<Failure, CreateTeamResponse>> createTeam(
      CreateTeamRequest createTeamRequest) {
    return catchError(() async {
      return _teamRemoteDataSource.createTeam(createTeamRequest);
    });
  }

  @override
  Future<Either<Failure, void>> deleteMember(
      {required int teamId, required Map<String, dynamic> memberId}) {
    return catchError(() async {
      await _teamRemoteDataSource.deleteMember(teamId, memberId);
    });
  }

  @override
  Future<Either<Failure, TeamDetailModel>> getTeamById(int teamId) {
    return catchError(() async {
      return _teamRemoteDataSource.getTeamById(teamId);
    });
  }

  @override
  Future<Either<Failure, List<TeamMemberModel>>> getTeamMembersByTeamId(
      int teamId) {
    return catchError(() async {
      var team = await _teamRemoteDataSource.getTeamById(teamId);

      var teamMembers = <TeamMemberModel>[];
      for (var element in team.teamMembers) {
        teamMembers.add(TeamMemberModel(
          id: element.id,
          imageUrl: element.imageUrl,
        ));
      }
      return teamMembers;
    });
  }

  @override
  Future<Either<Failure, List<TeamModel>>> getTeams() {
    return catchError(() async {
      return _teamRemoteDataSource.getTeams();
    });
  }

  @override
  Future<Either<Failure, void>> invitationNotification() {
    return catchError(() async {
      await _teamRemoteDataSource.invitationNotification();
    });
  }

  @override
  Future<Either<Failure, void>> inviteTeamByEmail(InviteTeam inviteTeam) {
    return catchError(() async {
      await _teamRemoteDataSource.inviteTeamByEmail(inviteTeam);
    });
  }
}
