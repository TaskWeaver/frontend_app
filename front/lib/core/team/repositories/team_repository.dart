import 'package:front/core/team/data/models/team.dart';
import 'package:front/core/team/domain/entities/team_entity.dart';
import 'package:front/core/utils/result.dart';

abstract class TeamRepository {
  // Future<Result<List<TeamEntity>>> getTeams();

  Future<Result<TeamModel>> createTeam(Map<String,dynamic> name);

  Future<Result<TeamModel>> getTeamById(int teamId);

  Future<Result> inviteTeamByEmail(String id);

  // Future<Result> checkInviteLink();w

  Future<Result> deleteMember(int teamId); //
  // 팀장 궈한 넘기기
  Future<Result> invitationNotification();

  Future<Result> invitationResponse(int teamId, int inviteState);
}