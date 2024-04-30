import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_detail_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_team_provider.g.dart';

@riverpod
Future<TeamDetailModel> selectedTeam(
  SelectedTeamRef ref,
  int teamId,
) async {
  final response = await getTeamByIdUseCase.call(teamId: teamId);

  return response.fold(
    onSuccess: (value) => TeamDetailModel.fromJson(value.result),
    onFailure: (e) => throw e,
  );
}
