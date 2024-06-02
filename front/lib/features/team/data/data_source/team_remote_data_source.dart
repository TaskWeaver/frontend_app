import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/data/models/create_team_response_model.dart';
import 'package:front/features/team/data/models/invite_response_model.dart';
import 'package:front/features/team/data/models/invite_team_model.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:front/features/team/data/models/team_model.dart';

abstract class TeamRemoteDataSource {
  Future<List<TeamModel>> getTeams();

  Future<TeamDetailModel> getTeamById(int teamId);

  Future<CreateTeamResponse> createTeam(CreateTeamRequest createTeamRequest);

  Future<void> inviteTeamByEmail(InviteTeam inviteTeam);

  Future<void> deleteMember(
    int teamId,
    Map<String, dynamic> memberId,
  );

  Future<void> invitationNotification();

  Future<void> answerToInvitation(InviteResponse inviteResponse);
}
