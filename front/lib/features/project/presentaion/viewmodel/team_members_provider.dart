import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_detail_member_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_members_provider.g.dart';

@riverpod
Future<List<TeamDetailMemberModel>> teamMembers(
  TeamMembersRef ref,
  int teamId,
) async {
  final response = await getTeamByIdUseCase.call(teamId: teamId);

  return response.fold(
      onSuccess: (value) {
        var teamMembers = <TeamDetailMemberModel>[];
        for (var member in value.result['teamMembers']) {
          teamMembers.add(TeamDetailMemberModel.fromJson(member));
        }
        return teamMembers;
      },
      onFailure: (e) => throw e);
}
