import 'package:front/app/locator.dart';
import 'package:front/features/data/models/invite_response.dart';
import 'package:front/features/data/models/invite_team.dart';
import 'package:front/features/data/models/team.dart';
import 'package:front/features/data/models/team_detail.dart';
import 'package:front/presentation/pages/team/team_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_controller.g.dart';

@riverpod
class TeamController extends _$TeamController {
  @override
  TeamState build() => const TeamState.loading();

  Future<void> getTeamById(int teamId) async {
    final response = await getTeamByIdUseCase.call(teamId: teamId);
    return response.fold(
      onSuccess: (value) => state =
          TeamState<TeamDetailModel>(TeamDetailModel.fromJson(value.result)),
      onFailure: (e) =>
          state = TeamState<TeamDetailModel>.error(message: e.toString()),
    );
  }

  Future<void> createTeam(String name) async {
    final response = await createTeamUseCase.call(name: name);

    return response.fold(
      onSuccess: (value) =>
          state = TeamState<TeamModel>(TeamModel.fromJson(value.result)),
      onFailure: (e) =>
          state = TeamState<TeamModel>.error(message: e.toString()),
    );
  }

  Future<void> answerToInvitation(InviteResponse inviteResponse) async {
    final response =
        await answerToInvitationUseCase.call(inviteResponse: inviteResponse);
    return response.fold(
      onSuccess: (value) => state = TeamState(value.result),
      onFailure: (e) => state = TeamState.error(message: e.toString()),
    );
  }

  Future<void> deleteMember(
      {required int teamId, required List<int> memberId}) async {
    final response =
        await deleteMemberUseCase.call(teamId: teamId, memberId: memberId);
    return response.fold(
      onSuccess: (value) => state = TeamState(value.result),
      onFailure: (e) => state = TeamState.error(message: e.toString()),
    );
  }

  Future<void> getTeams() async {
    final response = await getTeamsUseCase.call();
    return response.fold(
      onSuccess: (value) => state = TeamState(value.result),
      onFailure: (e) => state = TeamState.error(message: e.toString()),
    );
  }

  Future<void> invitationNotification() async {
    final response = await invitationNotificationUseCase.call();
    return response.fold(
      onSuccess: (value) => state = TeamState(value.result),
      onFailure: (e) => state = TeamState.error(message: e.toString()),
    );
  }

  Future<void> inviteTeamByEmail(InviteTeam inviteTeam) async {
    final response =
        await inviteTeamByEmailUseCase.call(inviteTeam: inviteTeam);
    return response.fold(
      onSuccess: (value) => state = TeamState(value.result),
      onFailure: (e) => state = TeamState.error(message: e.toString()),
    );
  }
}
