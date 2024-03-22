import 'package:front/app/locator.dart';
import 'package:front/core/team/data/models/team_detail.dart';
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
      onSuccess: (value) => state = TeamState(TeamDetailModel.fromJson(value.result)),
      onFailure: (e) => state = TeamState.error(message: e.toString()),
    );
  }
}
