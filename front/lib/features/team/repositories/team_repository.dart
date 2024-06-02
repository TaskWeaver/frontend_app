import 'package:dartz/dartz.dart';
import 'package:front/core/utils/failure.dart';
import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/data/models/create_team_response_model.dart';
import 'package:front/features/team/data/models/invite_response_model.dart';
import 'package:front/features/team/data/models/invite_team_model.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_member_model.dart';
import 'package:front/features/team/data/models/team_model.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<TeamModel>>> getTeams();

  Future<Either<Failure, CreateTeamResponse>> createTeam(
    CreateTeamRequest createTeamRequest,
  );

  Future<Either<Failure, TeamDetailModel>> getTeamById(int teamId);

  Future<Either<Failure, void>> inviteTeamByEmail(InviteTeam inviteTeam);

  Future<Either<Failure, void>> deleteMember({
    required int teamId,
    required Map<String, dynamic> memberId,
  });

  Future<Either<Failure, List<TeamMemberModel>>> getTeamMembersByTeamId(
      int teamId);

  Future<Either<Failure, void>> invitationNotification();

  Future<Either<Failure, void>> answerToInvitation(
      InviteResponse inviteResponse);
}
